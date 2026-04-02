import 'package:flutter/material.dart';
import '../../models/coin.dart';

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
      leading: Image.network(coin.image, width: 36, height: 36),
      title: Text(coin.name, style: const TextStyle(fontWeight: FontWeight.w500)),
      subtitle: Text(coin.symbol.toUpperCase(),
          style: const TextStyle(color: Colors.grey)),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text('\$${coin.price.toStringAsFixed(2)}',
                  style: const TextStyle(fontWeight: FontWeight.w500)),
              Text(
                '$changePrefix${coin.change24h.toStringAsFixed(2)}%',
                style: TextStyle(color: changeColor, fontSize: 12),
              ),
            ],
          ),
          const SizedBox(width: 8),
          GestureDetector(
            onTap: onFavoriteTap,
            child: Icon(
              isFavorite ? Icons.favorite : Icons.favorite_border,
              color: isFavorite ? Colors.red : Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}