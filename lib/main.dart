import 'package:crypto_market/services/watchlist_service.dart';
import 'package:crypto_market/ui/views/market/market_view.dart';
import 'package:flutter/material.dart';
import 'app/app.dart';
import 'ui/views/market/market_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  await locator<WatchlistService>().init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(home: MarketView());
  }
}
