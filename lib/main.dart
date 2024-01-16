import 'package:flutter/material.dart';
import 'package:tictactoe/home_page.dart';
import 'package:tictactoe/splash_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:SplashPage(),
      routes: {
        SplashPage.id:(context)=>SplashPage(),
        HomePage.id:(context)=>HomePage(),
      },
    );
  }
}
