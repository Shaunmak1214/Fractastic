import 'package:flutter/material.dart';
import 'package:fractastic/ui/chapter/chapter1/game.dart';
import 'package:fractastic/ui/chapter/chapter2/quiz.dart';
import 'package:fractastic/ui/chapter/chapter2/tutorial.dart';

import '../../constants.dart' as Constants;

class Chapter2OptionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chapter 2'),
        centerTitle: true,
        backgroundColor: Color(Constants.COLOR_ACCENT),
        // leading: new IconButton(
        //   icon: new Icon(Icons.arrow_back),
        //   onPressed: () => Navigator.of(context).pop(),
        // ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: double.infinity,
              height: 100,
              child: FlatButton.icon(
                  label: Text('Tutorial'),
                  //textTheme: TextTheme(headline5: ),
                  color: Colors.blueAccent[100],
                  icon: Icon(Icons.library_books),
                  textColor: Colors.black,
                  //shape: StadiumBorder(),
                  shape: BeveledRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  padding: EdgeInsets.symmetric(horizontal: 50),
                  splashColor: Colors.blueAccent[200],
                  onPressed: () => Navigator.push(context,
                      new MaterialPageRoute(builder: (_) => Chap2Tutorial()))),
            ),
          ),
          SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: double.infinity,
              height: 100,
              child: FlatButton.icon(
                  label: Text('Quiz'),
                  //textTheme: TextTheme(headline5: ),
                  color: Colors.yellowAccent[100],
                  icon: Icon(Icons.lightbulb_outline),
                  textColor: Colors.black,
                  //shape: StadiumBorder(),
                  shape: BeveledRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  padding: EdgeInsets.symmetric(horizontal: 50),
                  splashColor: Colors.yellowAccent[200],
                  onPressed: () => Navigator.push(context,
                      new MaterialPageRoute(builder: (_) => new Chap2Quiz()))),
            ),
          ),
          SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: double.infinity,
              height: 100,
              child: FlatButton.icon(
                  label: Text('Game'),
                  //textTheme: TextTheme(headline5: ),
                  color: Colors.redAccent[100],
                  icon: Icon(Icons.games),
                  textColor: Colors.black,
                  //shape: StadiumBorder(),
                  shape: BeveledRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  padding: EdgeInsets.symmetric(horizontal: 50),
                  splashColor: Colors.redAccent[200],
                  onPressed: () => Navigator.push(context,
                      new MaterialPageRoute(builder: (_) => Chap1game1()))),
            ),
          ),
        ],
      ),
    );
  }
}
