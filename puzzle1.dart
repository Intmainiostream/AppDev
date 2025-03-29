import 'package:flutter/material.dart';
import 'select.dart';
import 'dia1.dart'; // Import the dialogue screen for level 1

class PuzzleOneScreen extends StatefulWidget {
  @override
  _PuzzleOneScreenState createState() => _PuzzleOneScreenState();
}

class _PuzzleOneScreenState extends State<PuzzleOneScreen> {
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
              "LEVEL 1",
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
              width: 300, // Adjusted for rectangular aspect
              height: 170, // Adjusted to match tiles' new height
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white, width: 5), // White frame that fits new size
              ),
              child: GridView.builder(
                padding: EdgeInsets.zero,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, // 3x3 grid
                  crossAxisSpacing: 1,
                  mainAxisSpacing: 1,
                  childAspectRatio: 1.8, // Makes tiles rectangular (Wider than taller)
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
                                "assets/puzzle/art1/pz1-row-${index ~/ 3 + 1}-column-${index % 3 + 1}.png",
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

          // Scattered Puzzle Pieces (Adjusted for rectangular pieces)
          for (int i = 0; i < 9; i++)
            Positioned(
              left: 30.0 + (i % 3) * 75.0 + (i % 2 == 0 ? 10.0 : -5.0),
              top: 120.0 + (i ~/ 3) * 70.0 + (i % 2 == 0 ? -5.0 : 10.0),
              child: Draggable<String>(
                data: 'pz$i',
                child: placedPieces['pz$i'] == true
                    ? SizedBox.shrink()
                    : Image.asset(
                        "assets/puzzle/art1/pz1-row-${i ~/ 3 + 1}-column-${i % 3 + 1}.png",
                        width: 75, // Wider size for rectangular tiles
                        height: 50, // Shorter height for rectangular tiles
                      ),
                feedback: Image.asset(
                  "assets/puzzle/art1/pz1-row-${i ~/ 3 + 1}-column-${i % 3 + 1}.png",
                  width: 75,
                  height: 50,
                ),
                childWhenDragging: SizedBox.shrink(),
              ),
            ),

          // NEXT Button (only appears when puzzle is completed)
          if (isPuzzleCompleted)
            Positioned(
              bottom: 30, // Lower for better visibility
              left: 0,
              right: 0,
              child: Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => DialogueScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                    backgroundColor: const Color.fromARGB(255, 208, 208, 208), // Grey background
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  ),
                  child: Text(
                    "NEXT",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black, // Black text
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
