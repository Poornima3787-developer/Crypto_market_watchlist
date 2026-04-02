class Coin {
  final String id;
  final String symbol;
  final String name;
  final double price;
  final double change24h;
  final String image;
  final List<double> sparkline;

  Coin({
    required this.id,
    required this.symbol,
    required this.name,
    required this.price,
    required this.change24h,
    required this.image,
    required this.sparkline,
  });

  factory Coin.fromJson(Map<String, dynamic> json) {
    return Coin(
      id: json['id'],
      symbol: json['symbol'],
      name: json['name'],
      price: (json['current_price'] ?? 0).toDouble(),
      change24h: (json['price_change_percentage_24h'] ?? 0).toDouble(),
      image:json['image'] as String,
      sparkline:(json['sparkline_in_7d']?['price']as List?)?.map((e)=>(e as num).toDouble()).toList()??[],
    );
  }
}
