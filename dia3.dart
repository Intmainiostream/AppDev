import 'package:flutter/material.dart';
import 'select.dart'; // Ensure this is correctly linked to navigate back if needed

class DialogueScreen3 extends StatefulWidget {
  @override
  _DialogueScreenState createState() => _DialogueScreenState();
}

class _DialogueScreenState extends State<DialogueScreen3> {
  int dialogueIndex = 0;

  final List<Map<String, dynamic>> dialogues = [
  {
    "character": "purple",
    "text": "Come with me, Princess Sky. In my world, you'll never fade.",
    "color": const Color.fromARGB(255, 200, 2, 255),
    "textColor": Colors.white,
  },
  {
    "character": "sky",
    "text": "Your world... It feels empty, Mr.Purple. I belong to the sky, not to your shade.",
    "color": const Color.fromRGBO(124, 214, 255, 1),
    "textColor": Colors.black,
  },
  {
    "character": "purple",
    "text": "(voice trembling) Why can't you see... You're already part of me now.",
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
          // Main Background Image
          Positioned.fill(
            child: Image.asset("assets/art/Art3bg.png", fit: BoxFit.cover),
          ),

        
          // Level Title
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

          // Character Images
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
