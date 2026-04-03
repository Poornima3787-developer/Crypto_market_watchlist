import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import '../../models/coin.dart';
import 'package:fl_chart/fl_chart.dart';

class CoinListItem extends StatelessWidget {
  final Coin coin;
  final bool isFavorite;
  final VoidCallback onFavoriteTap;

  const CoinListItem({
    super.key,
    required this.coin,
    required this.isFavorite,
    required this.onFavoriteTap,
  });

  @override
  Widget build(BuildContext context) {
    final isPositive = coin.change24h >= 0;
    final changeColor = isPositive ? Colors.green : Colors.red;
    final changePrefix = isPositive ? '+' : '';

    return ListTile(
      isThreeLine: true,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      leading: Hero(tag:'coin-logo-${coin.id}',child: Image.network(coin.image, width: 36, height: 36)),
      title: Text(
        coin.name,
        style: const TextStyle(fontWeight: FontWeight.w500),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            coin.symbol.toUpperCase(),
            style: const TextStyle(color: Colors.grey),
          ),
          const SizedBox(height: 8),

          if (coin.sparkline.isNotEmpty)
            SizedBox(
              height: 30,
              child: LineChart(
                LineChartData(
                  gridData: FlGridData(show: false),
                  titlesData: FlTitlesData(show: false),
                  borderData: FlBorderData(show: false),
                  lineBarsData: [
                    LineChartBarData(
                      isCurved: true,
                      spots: coin.sparkline
                          .asMap()
                          .entries
                          .map((e) => FlSpot(e.key.toDouble(), e.value))
                          .toList(),
                      dotData: FlDotData(show: false),
                      color: changeColor,
                      barWidth: 2,
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '\$${coin.price.toStringAsFixed(2)}',
                style: const TextStyle(fontWeight: FontWeight.w500),
              ),
              Text(
                '$changePrefix${coin.change24h.toStringAsFixed(2)}%',
                style: TextStyle(color: changeColor, fontSize: 12),
              ),
            ],
          ),
          const SizedBox(width: 8),

          IconButton(
            constraints: const BoxConstraints(),
            padding: EdgeInsets.zero,
            onPressed: onFavoriteTap,
            icon: Icon(
              isFavorite ? Icons.favorite : Icons.favorite_border,
              color: isFavorite ? Colors.red : Colors.grey,
              size: 22,
            ),
          ),
        ],
      ),
    );
  }
}
