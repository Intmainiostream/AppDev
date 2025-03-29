import 'package:flutter/material.dart';
import 'select.dart';
import 'dia5.dart';

class PuzzleFiveScreen extends StatefulWidget {
  @override
  _PuzzleFiveScreenState createState() => _PuzzleFiveScreenState();
}

class _PuzzleFiveScreenState extends State<PuzzleFiveScreen> {
  Map<String, bool> placedPieces = {};
  final int totalPieces = 16; // 4x4 grid

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
              "LEVEL 5",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 32,
                fontFamily: 'TradeWinds',
                color: Colors.white,
              ),
            ),
          ),

          // Centered Puzzle Grid
          Center(
            child: Container(
              width: 250, // Adjusted for square aspect
              height: 250, // 4x4 grid
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white, width: 5),
              ),
              child: GridView.builder(
                padding: EdgeInsets.zero,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4, // 4 columns
                  crossAxisSpacing: 1,
                  mainAxisSpacing: 1,
                ),
                itemCount: 16,
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
                                "assets/puzzle/art5/pz5-row-${index ~/ 4 + 1}-column-${index % 4 + 1}.png",
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

          // Scattered Puzzle Pieces
          for (int i = 0; i < 16; i++)
            Positioned(
              left: 30.0 + (i % 4) * 70.0 + (i % 2 == 0 ? 10.0 : -5.0),
              top: 90.0 + (i ~/ 4) * 70.0 + (i % 2 == 0 ? -5.0 : 10.0),
              child: Draggable<String>(
                data: 'pz$i',
                child: placedPieces['pz$i'] == true
                    ? SizedBox.shrink()
                    : Image.asset(
                        "assets/puzzle/art5/pz5-row-${i ~/ 4 + 1}-column-${i % 4 + 1}.png",
                        width: 60,
                        height: 60,
                      ),
                feedback: Image.asset(
                  "assets/puzzle/art5/pz5-row-${i ~/ 4 + 1}-column-${i % 4 + 1}.png",
                  width: 60,
                  height: 60,
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
                      MaterialPageRoute(builder: (context) => DialogueScreen5()),
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
