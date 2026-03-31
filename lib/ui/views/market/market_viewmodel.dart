import 'package:stacked/stacked.dart';
import '../../../services/coin_api_service.dart';
import '../../../services/watchlist_service.dart';
import '../../../models/coin.dart';
import '../../../app/app.dart';

class MarketViewModel extends ReactiveViewModel {
  final _api = locator<CoinApiService>();
  final _watchList = locator<WatchlistService>();

  List<Coin> _coins = [];
  List<Coin> get coins => _coins;

  Future<void> fetchCoins() async {
    setBusy(true);
    try {
      _coins = await _api.fetchTopCoins(1);
    } catch (e) {
      setError(e);
    }
    setBusy(false);
  }

  @override
  List<ListenableServiceMixin> get listenableServices => [_watchList];

  void toggleFavorite(String id) {
    _watchList.toggleFavorite(id);
  }

  bool isFavorite(String id) {
    return _watchList.isFavorite(id);
  }
}
