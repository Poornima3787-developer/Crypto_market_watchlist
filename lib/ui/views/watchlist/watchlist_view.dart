import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'watchlist_view_model.dart';
import '../../widgets/coin_list_item.dart';

class WatchlistView extends StatelessWidget{
  const WatchlistView ({super.key});

  @override
  Widget build(BuildContext context){
     return ViewModelBuilder<WatchlistViewModel>.reactive(
      viewModelBuilder:()=>WatchlistViewModel(),
      disposeViewModel: false,
      builder:(context,viewModel,child){
        final coins=viewModel.watchlistCoins;
        return Scaffold(
          appBar:AppBar(title:const Text('Watchlist')),
          body:coins.isEmpty ? const Center(child:Text('Tap ♥ on any coin to save it here.'))
          :ListView.builder(
            itemCount:coins.length,
            itemBuilder:(context,index){
              final coin=coins[index];
              return CoinListItem(
                coin:coin,
                isFavorite:true,
                onFavoriteTap:()=>viewModel.toggleFavorite(coin.id),
              );
            },
          ),
        );
      }
     );
  }
}