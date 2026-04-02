import 'package:stacked/stacked.dart';
import '../../../models/coin.dart';
import '../../../app/app.dart';
import '../../../services/watchlist_service.dart';
import '../../../services/coin_service.dart';

class WatchlistViewModel extends BaseViewModel with ListenableServiceMixin {
  final _watchlistService = locator<WatchlistService>();
  final _coinService = locator<CoinService>();

  WatchlistViewModel() {
    listenToReactiveValues([_watchlistService, _coinService]);
  }

  List<Coin> get watchlistCoins {
    final allCoins = _coinService.coins;
    final favIds = _watchlistService.savedCoins;
    return allCoins.where((c) => favIds.contains(c.id)).toList();
  }

  Future<void> toggleFavorite(String id) async {
    await _watchlistService.toggleFavorite(id);
  }
}
