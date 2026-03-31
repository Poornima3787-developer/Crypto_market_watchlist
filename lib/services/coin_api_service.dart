import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/coin.dart';

class RateLimitExecption implements Exception {}

class CoinApiService {
  Future<List<Coin>> fetchTopCoins(int page) async {
    final url = Uri.parse(
      "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&ids=bitcoin&names=Bitcoin&symbols=btc&category=layer-1&price_change_percentage=1h&per_page=20&page=$page&order=market_cap_desc&sparkline=false",
    );
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final List data = jsonDecode(response.body);
      return data.map((e) => Coin.fromJson(e)).toList();
    } else if (response.statusCode == 429) {
      throw RateLimitExecption();
    } else {
      throw Exception("Failed to fetch coins");
    }
  }
}
