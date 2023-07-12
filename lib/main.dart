import 'package:flutter/material.dart';
import 'bmi_app.dart';


void main(){
  runApp(myApp());
}  
class myApp extends StatelessWidget {
  const myApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme:ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.blue[800],
      ),
      debugShowCheckedModeBanner: false,
      home: bmiApp(),
      title: "Tittle",
    );
 
  }
}