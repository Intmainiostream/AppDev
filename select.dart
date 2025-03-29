import 'package:flutter/material.dart';
import 'home.dart'; 
import 'level1.dart'; 
import 'level2.dart'; 
import 'level3.dart'; 
import 'level4.dart'; 
import 'level5.dart'; 

class LevelSelectionScreen extends StatelessWidget {
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
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                );
              },
              child: Image.asset("assets/exit.png", width: 30, height: 30),
            ),
          ),

          // Title
          Positioned(
            top: 50,
            left: 0,
            right: 0,
            child: Text(
              "SELECT LEVEL",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 32,
                fontFamily: 'TradeWinds',
                color: Colors.white,
              ),
            ),
          ),

         
          Positioned(
            top: 150,
            left: 50,
            right: 50,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildLevelButton(context, 1, isUnlocked: true),
                    SizedBox(width: 15),
                    _buildLevelButton(context, 2, isUnlocked: true),
                    SizedBox(width: 15),
                    _buildLevelButton(context, 3, isUnlocked: true),
                  ],
                ),
                SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildLevelButton(context, 4, isUnlocked: true),
                    SizedBox(width: 15),
                    _buildLevelButton(context, 5, isUnlocked: true),
                    SizedBox(width: 15),
                    _buildLevelButton(context, 6, isUnlocked: false),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLevelButton(BuildContext context, int level, {required bool isUnlocked}) {
    return GestureDetector(
      onTap: isUnlocked
          ? () {
              if (level == 1) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => LevelOneScreen()),
                );
              } else if (level == 2) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => LevelTwoScreen()),
                );
                 } else if (level == 3) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => LevelThreeScreen()),
                );
               
               } else if (level == 5) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => LevelFiveScreen()),
                );
              }
            }
          : null,
      child: Container(
        width: 70,
        height: 70,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white, width: 2),
          borderRadius: BorderRadius.circular(8),
        ),
        child: isUnlocked
            ? Text(
                "$level",
                style: TextStyle(
                  fontSize: 22,
                  fontFamily: 'Julee',
                  color: Colors.white,
                ),
              )
            : Image.asset("assets/lockk.png", width: 30, height: 30),
      ),
    );
  }
}
