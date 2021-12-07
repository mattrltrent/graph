import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'home_screen2.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          HomeScreen2(),
        ],
      ),
    );
  }
}
