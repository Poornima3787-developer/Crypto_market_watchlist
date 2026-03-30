import 'package:stacked/stacked.dart';

class WatchlistService with ListenableServiceMixin{
  final List<String> _savedCoinsId=[];

  List<String> get savedCoins=>_savedCoinsId;

  void toggleFavorite(String id){
    if(_savedCoinsId.contains(id)){
      _savedCoinsId.remove(id);
    }else{
      _savedCoinsId.add(id);
    }
    notifyListeners();
  }

  bool isFavorite(String id){
    return _savedCoinsId.contains(id);
  }
}