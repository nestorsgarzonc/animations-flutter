import 'package:animate_do/animate_do.dart';
import 'package:animations/scr/pages/navigation_page.dart';
import 'package:animations/scr/pages/twitter_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/fa_icon.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Page1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animations'),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: FaIcon(FontAwesomeIcons.twitter),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => TwitterPage(),
                ),
              );
            },
          ),
          SlideInDown(
            from: 100,
            duration: Duration(milliseconds: 1000),
            child: IconButton(
              icon: Icon(Icons.navigate_next),
              onPressed: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (BuildContext context) => Page1(),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElasticIn(
                delay: Duration(milliseconds: 1100),
                child: Icon(Icons.new_releases, color: Colors.blue, size: 40)),
            FadeInDown(
              delay: Duration(milliseconds: 500),
              child: Text(
                'Large text',
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.w200),
              ),
            ),
            FadeInDown(
              delay: Duration(milliseconds: 2000),
              child: Text(
                'Short text',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
              ),
            ),
            FadeInLeft(
              delay: Duration(milliseconds: 1100),
              child: Container(
                height: 2,
                width: 300,
                color: Colors.blue,
              ),
            )
          ],
        ),
      ),
      floatingActionButton: ElasticIn(
        delay: Duration(milliseconds: 1000),
        child: FloatingActionButton(
          child: FaIcon(FontAwesomeIcons.play),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => NavigationPage()));
          },
        ),
      ),
    );
  }
}
