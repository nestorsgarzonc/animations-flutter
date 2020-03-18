import 'package:animations/scr/pages/page1.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Animations App',
      debugShowCheckedModeBanner: false,
      home: Page1(),
    );
  }
}
