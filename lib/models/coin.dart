class Coin{
  final String id;
  final String symbol;
  final String name;
  final double price;
  final double change24h;

  Coin({
    required this.id,
    required this.symbol,
    required this.name,
    required this.price,
    required this.change24h
  });

factory Coin.fromJson(Map<String,dynamic> json){
  return Coin(
    id:json['id'],
    symbol:json['symbol'],
    name:json['name'],
    price:(json['current_price']?? 0).toDouble(),
    change24h:(json['price_change_percentage_24h']??0).toDouble()
  );
}
}