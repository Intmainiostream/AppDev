import 'package:flutter/material.dart';
import 'dart:async'; 
import 'home.dart'; 
import 'level1.dart';
import 'level2.dart';
import 'level3.dart';
import 'puzzle1.dart';
import 'puzzle2.dart';
import 'puzzle3.dart';
import 'puzzle4.dart';
import 'puzzle5.dart';
import 'dia1.dart';
import 'dia2.dart';
import 'dia3.dart';
import 'dia4.dart';
import 'dia5.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PuzzleFiveScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
  
    Timer(const Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF24092B),
      body: Center(
        child: Image.asset(
          'assets/dzzle.png',
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
