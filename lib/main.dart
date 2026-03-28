import 'package:flutter/material.dart';
import 'app/app.dart';
import './services/coin_api_service.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();

  final api=CoinApiService();
  final coins=await api.fetchTopCoins(1);

  for(var coin in coins){
    print("${coin.name} - \$${coin.price}");
  }

  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  Widget build(BuildContext context){
    return MaterialApp(
     home:Scaffold(
      body:Center(
        child:Text("Crypto App Starting..."),
        ),
     ),
    );
  }
}