import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'main_layout_viewmodel.dart';
import '../market/market_view.dart';
import '../watchlist/watchlist_view.dart';

class MainLayoutView extends StatelessWidget{
  const MainLayoutView({super.key});
 
 @override
  Widget build(BuildContext context){
    return ViewModelBuilder<MainLayoutViewModel>.reactive(
      viewModelBuilder:()=>MainLayoutViewModel(),
      builder:(context,viewModel,child)=>Scaffold(
        body:IndexedStack(
          index:viewModel.currentIndex,
          children:[MarketView(),WatchlistView()],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex:viewModel.currentIndex,
          onTap:viewModel.setIndex,
          items:const [
            BottomNavigationBarItem(icon:Icon(Icons.bar_chart),label:'Market'),
            BottomNavigationBarItem(icon:Icon(Icons.favorite),label:'WatchList'),
          ]
        ),
      )
    );
  }
}