import 'package:flutter/material.dart';
import 'package:flutter_guess_game/app/navigation/router.dart';
import 'package:flutter_guess_game/app/theme/new_theme.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key,});
  static const routeName = "/home";

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  int _counter = 50;

  void _incrementCounter() {
    setState(() {
      if (_counter < 100) {
        _counter++;
      }
    });
  }

  void _decrementCounter() {
    setState(() {
      if (_counter > 1) {
        _counter--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.greenColor.shade700,
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            IconButton(
              icon: const Icon(Icons.arrow_left, color: Colors.yellow),
              onPressed: _decrementCounter,
            ),
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: globalCtx.darkColor.shade900,
              ),
              child: Center(
                child: Text(
                  '$_counter',
                  style: TextStyle(fontSize: 40, color: Colors.white),
                ),
              ),
            ),
            IconButton(
              icon: Icon(Icons.arrow_right, color: Colors.yellow),
              onPressed: _incrementCounter,
            ),
          ],
        ),
      ),
    );
  }
}
