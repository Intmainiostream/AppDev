import 'package:flutter/material.dart';
import 'select.dart'; 

class DialogueScreen4 extends StatefulWidget {
  @override
  _DialogueScreenState createState() => _DialogueScreenState();
}

class _DialogueScreenState extends State<DialogueScreen4> {
  int dialogueIndex = 0;

final List<Map<String, dynamic>> dialogues = [
  {
    "character": "sky",
    "text": "You're... not human? What is this place, Mr.Purple? (panics)",
    "color": const Color.fromRGBO(124, 214, 255, 1),
    "textColor": Colors.black,
  },
  {
    "character": "purple",
    "text": "A world where colors are eternal. And you... you'll be mine forever here.",
    "color": const Color.fromARGB(255, 200, 2, 255),
    "textColor": Colors.white,
  },
  {
    "character": "sky",
    "text": "No... I can't. I can't follow you into this darkness.",
    "color": const Color.fromRGBO(124, 214, 255, 1),
    "textColor": Colors.black,
  },
  {
    "character": "purple",
    "text": "(grins) Then I'll turn this world into mine... so you’ll have nowhere else to run.",
    "color": const Color.fromARGB(255, 200, 2, 255),
    "textColor": Colors.white,
  }
];


  void nextDialogue() {
    if (dialogueIndex < dialogues.length - 1) {
      setState(() {
        dialogueIndex++;
      });
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LevelSelectionScreen()), 
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
       
          Positioned.fill(
            child: Image.asset("assets/art/Art4bg.png", fit: BoxFit.cover),
          ),

        
         
          Positioned(
            top: 20,
            left: 0,
            right: 0,
            child: Text(
              "LEVEL 3",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 32,
                fontFamily: 'TradeWinds',
                color: Colors.white,
              ),
            ),
          ),

        
          Positioned(
            left: 30,
            bottom: 55,
            child: Image.asset("assets/character/purple.png", width: 170),
          ),
          Positioned(
            right: 30,
            bottom: 45,
            child: Image.asset("assets/character/sky.png", width: 120),
          ),

          // Dialogue Box
          Positioned(
            bottom: 20,
            left: 20,
            right: 20,
            child: GestureDetector(
              onTap: nextDialogue,
              child: Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: dialogues[dialogueIndex]["color"],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      dialogues[dialogueIndex]["text"],
                      style: TextStyle(
                        fontSize: 18,
                        fontFamily: 'Julee',
                        color: dialogues[dialogueIndex]["textColor"],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
