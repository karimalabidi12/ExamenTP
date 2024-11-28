import 'package:flutter/material.dart';
import 'package:testkarima/home_page.dart';
import 'package:testkarima/intro_page.dart';

void main() {
  runApp(
    MaterialApp(
      initialRoute: '/intro_page', // Route initiale si nécessaire
      routes: {
        '/home_page': (context) => HomePage(),
        '/intro_page': (context) => IntroPage(),
      },
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: IntroPage(),
      ),
    );
  }
}
