import 'package:flutter/material.dart';


import 'dart:async';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:simple_food_app/FoodListScreen.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  double _opacity = 0.0; // Initial opacity for the image

  @override
  void initState() {
    super.initState();

    // Fade-in animation for the image
    Timer(Duration(milliseconds: 500), () {
      setState(() {
        _opacity = 1.0; // Set opacity to 1.0 for full visibility
      });
    });

    // Move to the FoodScreen after 5 seconds
    Timer(Duration(seconds: 7), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => FoodListScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: AnimatedOpacity(
          opacity: _opacity, // Opacity value for the fade-in effect
          duration: Duration(seconds: 4), // Duration for the fade effect
          child: Container(
            decoration: BoxDecoration(

            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Add Lottie animation
              
                  Text(
                    'Welcome to the App!',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 15,),

                  SingleChildScrollView(
                    child: Lottie.asset(
                      "assets/splash.json",
                    ),
                  ),
              
              
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}



