import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Chap1game1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RaisedButton(
          onPressed: _launchURL,
          child: Text('Play Game !'),
        ),
      ),
    );
  }
}

_launchURL() async {
  {
    const url = 'https://www.mathplayground.com/fraction_forest_part1.html';
    if (await canLaunch(url)) {
      print('loading url');
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
