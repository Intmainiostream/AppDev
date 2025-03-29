import 'package:flutter/material.dart';
import 'select.dart';
import 'puzzle5.dart';

class LevelFiveScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.asset("assets/bg.png", fit: BoxFit.cover),
          ),

          // Exit Button
          Positioned(
            top: 40,
            left: 20,
            child: GestureDetector(
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => LevelSelectionScreen()),
                );
              },
              child: Image.asset("assets/exit.png", width: 30, height: 30),
            ),
          ),

          // Level Content
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Level Title
                Text(
                  "LEVEL 5",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 32,
                    fontFamily: 'TradeWinds',
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 20),

                // Level Artwork
                Image.asset("assets/art/Art5.png", width: 500, height: 200),
                SizedBox(height: 20),

                // Level Subtitle
                Text(
                  "The Sky Weeps",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    fontFamily: 'Frijole',
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 20),

                // Start Button
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 209, 208, 208),
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                    textStyle: TextStyle(
                      fontSize: 22,
                      fontFamily: 'Frijole',
                      color: Colors.black,
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PuzzleFiveScreen()),
                    );
                  },
                  child: Text("START", style: TextStyle(color: Colors.black)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
