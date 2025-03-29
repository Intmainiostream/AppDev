import 'package:flutter/material.dart';
import 'select.dart'; 

class DialogueScreen5 extends StatefulWidget {
  @override
  _DialogueScreenState createState() => _DialogueScreenState();
}

class _DialogueScreenState extends State<DialogueScreen5> {
  int dialogueIndex = 0;

  final List<Map<String, dynamic>> dialogues = [
    {
      "character": "purple",
      "text": "Look around you, Skyblues... do you see it? The world is finally becoming what it was meant to be! A masterpiece of purple!",
      "color": const Color.fromARGB(255, 200, 2, 255),
      "textColor": Colors.white,
    },
    {
      "character": "sky",
      "text": "No... no, this isn’t beauty! The trees, the sky, everything is fading! This isn't creation, Mr. Purple, it's destruction!",
      "color": const Color.fromRGBO(124, 214, 255, 1),
      "textColor": Colors.black,
    },
    {
      "character": "purple",
      "text": "You don't understand! I'm saving it! Colors die, but purple... purple is eternal! We’ll be eternal!",
      "color": const Color.fromARGB(255, 200, 2, 255),
      "textColor": Colors.white,
    },
    {
      "character": "sky",
      "text": "You're suffocating it! You're suffocating *me*! I can't breathe... the air... it’s thick with—(coughs violently)",
      "color": const Color.fromRGBO(124, 214, 255, 1),
      "textColor": Colors.black,
    },
    {
      "character": "purple",
      "text": "(laughs) You always doubted me, Skyblues. But once you see the final shade, you'll understand... you'll *love* it!",
      "color": const Color.fromARGB(255, 200, 2, 255),
      "textColor": Colors.white,
    },
    {
      "character": "sky",
      "text": "No, Mr. Purple... you’re wrong. This isn’t love... this is obsession... and it’s killing me...",
      "color": const Color.fromRGBO(124, 214, 255, 1),
      "textColor": Colors.black,
    },
    {
      "character": "narrator",
      "text": "The sky swirls into a deep violet. The flowers, the grass—everything consumed by purple hues. Mr. Purple smiles in triumph... unaware that the very color he adores is draining the life from the one he loves most.",
      "color": Colors.black,
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
          // Background Transitioning to Purple
          Positioned.fill(
            child: Image.asset("assets/art/Art5bg.png", fit: BoxFit.cover),
          ),

          // Level Title
          Positioned(
            top: 20,
            left: 0,
            right: 0,
            child: Text(
              "LEVEL 5",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 32,
                fontFamily: 'TradeWinds',
                color: Colors.white,
              ),
            ),
          ),

          // Character Sprites
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
