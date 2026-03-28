import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../services/coin_api_service.dart';
import '../services/watchlist_service.dart';

final locator=StackedLocator.instance;

Future <void> setupLocator() async{
  locator.registerLazySingleton(()=>CoinApiService());
  locator.registerLazySingleton(()=>WatchlistService());
}