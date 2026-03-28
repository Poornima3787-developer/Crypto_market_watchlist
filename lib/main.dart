import 'package:flutter/material.dart';
import 'app/app.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();

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