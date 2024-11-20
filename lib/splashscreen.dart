import 'package:flutter/material.dart';
import 'package:first_test/main.dart'; 
import 'homepage.dart'; // Replace with your main app page

// THE STARTUP SCREEN
class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _visible = false; // Start with invisible

  @override
  void initState() {
    super.initState();
    _startAnimation();
  }

  void _startAnimation() async {
    await Future.delayed(Duration(milliseconds: 1000)); // Delay before starting the animation

    // Show images
    setState(() {
      _visible = true;
    });
    await Future.delayed(Duration(milliseconds: 2000)); // Display images for 2 seconds

    // Hide images
    setState(() {
      _visible = false;
    });
    await Future.delayed(Duration(milliseconds: 800)); // Wait for fade out

    // Navigate to home
    _navigateToHome();
  }

  void _navigateToHome() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => MyHomePage(), // Replace with your main app page
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      body: Center(
        child: AnimatedOpacity(
          opacity: _visible ? 1.0 : 0.0,
          duration: Duration(milliseconds: 800), // Set the duration to milliseconds
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0), // Add padding to prevent overflow
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  child: Image.asset(
                    'assets/images/MMU.png',
                  ),
                ),
                SizedBox(width: 20), // Space between images
                Flexible(
                  child: Image.asset(
                    'assets/images/HCTM.jpg',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}