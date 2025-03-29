import 'package:flutter/material.dart';
import 'select.dart';
import 'dia2.dart'; // Import the dialogue screen for level 2

class PuzzleTwoScreen extends StatefulWidget {
  @override
  _PuzzleTwoScreenState createState() => _PuzzleTwoScreenState();
}

class _PuzzleTwoScreenState extends State<PuzzleTwoScreen> {
  Map<String, bool> placedPieces = {};
  final int totalPieces = 9;

  bool get isPuzzleCompleted => placedPieces.length == totalPieces && placedPieces.values.every((placed) => placed);

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

          // Centered Level Title
          Positioned(
            top: 30,
            left: 0,
            right: 0,
            child: Text(
              "LEVEL 2",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 32,
                fontFamily: 'TradeWinds',
                color: Colors.white,
              ),
            ),
          ),

          // Centered Puzzle Grid (Rectangle Frame)
          Center(
            child: Container(
              width: 300,
              height: 170,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white, width: 5),
              ),
              child: GridView.builder(
                padding: EdgeInsets.zero,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 1,
                  mainAxisSpacing: 1,
                  childAspectRatio: 1.8,
                ),
                itemCount: 9,
                itemBuilder: (context, index) {
                  String pieceKey = 'pz$index';
                  return DragTarget<String>(
                    onAccept: (data) {
                      if (data == pieceKey) {
                        setState(() {
                          placedPieces[pieceKey] = true;
                        });
                      }
                    },
                    builder: (context, candidateData, rejectedData) {
                      return Container(
                        color: placedPieces[pieceKey] == true
                            ? Colors.transparent
                            : Colors.grey[850],
                        child: placedPieces[pieceKey] == true
                            ? Image.asset(
                                "assets/puzzle/art2/pz2-row-${index ~/ 3 + 1}-column-${index % 3 + 1}.png",
                                fit: BoxFit.cover,
                              )
                            : null,
                      );
                    },
                  );
                },
              ),
            ),
          ),

          // Scattered Puzzle Pieces (Adjusted for Level 2)
          for (int i = 0; i < 9; i++)
            Positioned(
              left: 30.0 + (i % 3) * 75.0 + (i % 2 == 0 ? 10.0 : -5.0),
              top: 120.0 + (i ~/ 3) * 70.0 + (i % 2 == 0 ? -5.0 : 10.0),
              child: Draggable<String>(
                data: 'pz$i',
                child: placedPieces['pz$i'] == true
                    ? SizedBox.shrink()
                    : Image.asset(
                        "assets/puzzle/art2/pz2-row-${i ~/ 3 + 1}-column-${i % 3 + 1}.png",
                        width: 75,
                        height: 50,
                      ),
                feedback: Image.asset(
                  "assets/puzzle/art2/pz2-row-${i ~/ 3 + 1}-column-${i % 3 + 1}.png",
                  width: 75,
                  height: 50,
                ),
                childWhenDragging: SizedBox.shrink(),
              ),
            ),

          // NEXT Button (only appears when puzzle is completed)
          if (isPuzzleCompleted)
            Positioned(
              bottom: 30,
              left: 0,
              right: 0,
              child: Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => DialogueScreen2()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                    backgroundColor: const Color.fromARGB(255, 208, 208, 208),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  ),
                  child: Text(
                    "NEXT",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontFamily: 'TradeWinds',
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
