import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import './market_viewmodel.dart';
import '../../widgets/coin_detail_view.dart';

class MarketView extends StatefulWidget {
  @override
  State<MarketView> createState()=>_MarketViewState();
}

class _MarketViewState extends State<MarketView>{
  bool isSearching =false;
  final TextEditingController _controller=TextEditingController();
  Widget build(BuildContext context) {
    return ViewModelBuilder<MarketViewModel>.reactive(
      viewModelBuilder: () => MarketViewModel(),
      onViewModelReady: (model) => model.fetchCoins(),
      builder: (context, model, child) {
        final coins = model.coins ?? [];
        return Scaffold(
          appBar: AppBar(
            title: isSearching?TextField(controller:_controller,
            autofocus:true,
            decoration:const InputDecoration(
              hintText:"Search coin...",
              border:InputBorder.none,
            ),
            onChanged:(value){
              model.searchCoins(value);
            },
            ):const Text("Crypto Market"),
            actions:[
              IconButton(icon: Icon(isSearching?Icons.close:Icons.search),
              onPressed:(){
                setState((){
                  isSearching=!isSearching;
                  if(!isSearching){
                    _controller.clear();
                    model.searchCoins("");
                  }
                });
              })
            ]
            ),
          body: ListView.builder(
            itemCount: coins.length,
            itemBuilder: (context, index) {
              final coin = coins[index];
              final isFav = model.isFavorite(coin.id);

              return GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    backgroundColor: Colors.transparent,
                    builder: (_) => CoinDetailView(coin: coin),
                  );
                },
                child: ListTile(
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
                ),
              );
            },
          ),
        );
      },
    );
  }
}
