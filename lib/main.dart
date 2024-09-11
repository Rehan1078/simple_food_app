import 'package:flutter/material.dart';
import 'package:simple_food_app/SplashScreen.dart';

import 'FoodListScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Splashscreen(),
    );
  }
}

class FoodItem {
  String title;
  String subtitle;
  String imageUrl;
  bool isInCart;

  FoodItem({
    required this.title,
    required this.subtitle,
    required this.imageUrl,
    this.isInCart = false,
  });
}

