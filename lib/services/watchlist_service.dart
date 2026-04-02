import 'package:stacked/stacked.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WatchlistService with ListenableServiceMixin {
  static const _prefskey = 'watchlist_ids';
  final List<String> _savedCoinsId = [];

  List<String> get savedCoins => List.unmodifiable(_savedCoinsId);

  Future<void> init() async {
    final prefs = await SharedPreferences.getInstance();
    final saved = prefs.getStringList(_prefskey) ?? [];
    _savedCoinsId
      ..clear()
      ..addAll(saved);
    notifyListeners();
  }

  Future<void> toggleFavorite(String id) async {
    if (_savedCoinsId.contains(id)) {
      _savedCoinsId.remove(id);
    } else {
      _savedCoinsId.add(id);
    }
    notifyListeners();
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(_prefskey, _savedCoinsId);
  }

  bool isFavorite(String id) {
    return _savedCoinsId.contains(id);
  }
}
