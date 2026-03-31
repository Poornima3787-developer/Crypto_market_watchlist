import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import './market_viewmodel.dart';

class MarketView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MarketViewModel>.reactive(
      viewModelBuilder: () => MarketViewModel(),
      onViewModelReady: (model) => model.fetchCoins(),
      builder: (context, model, child) {
        final coins = model.coins ?? [];
        return Scaffold(
          appBar: AppBar(title: Text("Crypto Market")),
          body: ListView.builder(
            itemCount: coins.length,
            itemBuilder: (context, index) {
              final coin = coins[index];
              final isFav = model.isFavorite(coin.id);

              return ListTile(
                title: Text(coin.name),
                subtitle: Text("\$${coin.price}"),
                trailing: IconButton(
                  icon: Icon(
                    isFav ? Icons.favorite : Icons.favorite_border,
                    color: isFav ? Colors.red : null,
                  ),
                  onPressed: () {
                    model.toggleFavorite(coin.id);
                  },
                ),
              );
            },
          ),
        );
      },
    );
  }
}
