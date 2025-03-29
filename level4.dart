import 'package:flutter/material.dart';
import 'select.dart';
import 'puzzle4.dart';


class LevelFourScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
         
          Positioned.fill(
            child: Image.asset("assets/bg.png", fit: BoxFit.cover),
          ),

         
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

         
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              
                Text(
                  "LEVEL 4",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 32,
                    fontFamily: 'TradeWinds',
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 20),

                
                Image.asset("assets/art/Art4.png", width: 500, height: 200),
                SizedBox(height: 20),

               
                Text(
                  "Your True Colors",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    fontFamily: 'Frijole',
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 20),

               
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
                      MaterialPageRoute(builder: (context) => PuzzleFourScreen()),
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
