import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'select.dart'; // Import your selection screen

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String username = "USERNAME";

  @override
  void initState() {
    super.initState();
    _loadUsername();
  }

  Future<void> _loadUsername() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      username = prefs.getString('username') ?? "TYPE USERNAME";
    });
  }

  Future<void> _changeUsername() async {
    TextEditingController _controller = TextEditingController(text: username);
    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Enter Username"),
        content: TextField(
          controller: _controller,
          maxLength: 10,
          decoration: InputDecoration(counterText: ""),
        ),
        actions: [
          TextButton(
            onPressed: () async {
              SharedPreferences prefs = await SharedPreferences.getInstance();
              String newUsername = _controller.text.trim();

              if (newUsername.length > 10) {
                newUsername = newUsername.substring(0, 10);
              }

              await prefs.setString('username', newUsername);
              setState(() {
                username = newUsername;
              });
              Navigator.pop(context);
            },
            child: Text("Save"),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset("assets/bg.png", fit: BoxFit.cover),
          ),
          Positioned(
            left: -30,
            top: 5,
            width: MediaQuery.of(context).size.width * 0.4,
            child: Image.asset("assets/web.png", fit: BoxFit.contain),
          ),
          Positioned(
            right: -30,
            bottom: 50,
            width: MediaQuery.of(context).size.width * 0.6,
            child: Image.asset("assets/crack.png", fit: BoxFit.contain),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "FRAGMENTS",
                  style: TextStyle(
                    fontSize: 40,
                    fontFamily: 'TradeWinds',
                    color: const Color.fromARGB(255, 104, 198, 241),
                  ),
                ),
                Text(
                  "OF",
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'TradeWinds',
                    color: Colors.white,
                  ),
                ),
                Text(
                  "HUE",
                  style: TextStyle(
                    fontSize: 40,
                    fontFamily: 'TradeWinds',
                    color: const Color.fromARGB(255, 170, 0, 255),
                  ),
                ),
                SizedBox(height: 20),
                _buildButton("START", () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LevelSelectionScreen()),
                  );
                }),
                _buildButton("GALLERY", () {}),
                _buildButton("SETTINGS", () {}),
              ],
            ),
          ),
          Positioned(
            bottom: 20,
            right: 20,
            child: GestureDetector(
              onTap: _changeUsername,
              child: Text(
                username,
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'Frijole',
                  color: const Color.fromARGB(255, 240, 239, 239),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildButton(String text, VoidCallback onPressed) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromARGB(255, 209, 208, 208),
          padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
          textStyle: TextStyle(
            fontSize: 24,
            fontFamily: 'Frijole',
            color: Colors.black,
          ),
        ),
        onPressed: onPressed,
        child: Text(text, style: TextStyle(color: Colors.black)),
      ),
    );
  }
}
