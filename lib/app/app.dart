import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:get_it/get_it.dart';

import '../services/coin_api_service.dart';
import '../services/watchlist_service.dart';

final locator=GetIt.instance;

Future <void> setupLocator() async{
  locator.registerLazySingleton(()=>CoinApiService());
  locator.registerLazySingleton(()=>WatchlistService());
}