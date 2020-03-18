import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/fa_icon.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TwitterPage extends StatefulWidget {
  @override
  _TwitterPageState createState() => _TwitterPageState();
}

class _TwitterPageState extends State<TwitterPage> {
  bool activarAnimatin = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1DA1F2),
      body: Center(
        child: ZoomOut(
          animate: activarAnimatin,
          duration: Duration(milliseconds: 1000),
          from: 20,
          child: FaIcon(
            FontAwesomeIcons.twitter,
            color: Colors.white,
            size: 50,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.pink,
        child: Icon(Icons.play_circle_filled),
        onPressed: () {
          setState(() {
            activarAnimatin = !activarAnimatin;
          });
        },
      ),
    );
  }
}
