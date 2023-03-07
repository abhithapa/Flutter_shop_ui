import 'package:flutter/material.dart';
import 'package:my_shop/screens/homepage.dart';
import 'package:my_shop/screens/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "My shop",
      theme: ThemeData(
        primarySwatch: Colors.green, fontFamily: 'MontserratAlternates'
      ),
      home: const SplashScreen(),
    );
  }
}
