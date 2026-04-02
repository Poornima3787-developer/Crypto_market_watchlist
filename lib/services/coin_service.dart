import 'package:stacked/stacked.dart';
import '../models/coin.dart';

class CoinService with ListenableServiceMixin {
  final List<Coin> _coins = [];

  List<Coin> get coins => List.unmodifiable(_coins);

  void setCoins(List<Coin> newCoins) {
    _coins
      ..clear()
      ..addAll(newCoins);

    notifyListeners();
  }
}