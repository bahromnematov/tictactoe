import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tictactoe/home_page.dart';

class SplashPage extends StatefulWidget {
  static final String id="splash_page";
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
 @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 3),(){
      Navigator.pushReplacementNamed(context, HomePage.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset("assets/img.png",fit: BoxFit.cover,),
      ),
    );
  }
}
