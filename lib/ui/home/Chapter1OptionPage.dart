import 'package:flutter/material.dart';
import 'package:fractastic/ui/chapter/chapter1/game.dart';
import 'package:fractastic/ui/chapter/chapter1/quiz.dart';
import 'package:fractastic/ui/chapter/chapter1/tutorial.dart';

import '../../constants.dart' as Constants;

class Chapter1OptionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chapter 1'),
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
            padding: const EdgeInsets.all(35.0),
            child: SizedBox(
              width: double.infinity,
              height: 90,
              child: FlatButton.icon(
                  label: Text(
                    'Tutorial',
                    style: TextStyle(
                      fontSize: 25.0,
                    ),
                  ),
                  //textTheme: TextTheme(headline5: ),
                  color: Colors.blueAccent[100],
                  icon: Icon(
                    Icons.library_books,
                    size: 30.0,
                  ),
                  textColor: Colors.black,
                  //shape: StadiumBorder(),
                  shape: BeveledRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  padding: EdgeInsets.symmetric(horizontal: 50),
                  splashColor: Colors.blueAccent[200],
                  onPressed: () => Navigator.push(context,
                      new MaterialPageRoute(builder: (_) => Chap1Tutorial()))),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(35.0),
            child: SizedBox(
              width: double.infinity,
              height: 90,
              child: FlatButton.icon(
                  label: Text(
                    'Quiz',
                    style: TextStyle(fontSize: 25.0),
                  ),
                  //textTheme: TextTheme(headline5: ),
                  color: Colors.yellowAccent[100],
                  icon: Icon(
                    Icons.lightbulb_outline,
                    size: 30.0,
                  ),
                  textColor: Colors.black,
                  //shape: StadiumBorder(),
                  shape: BeveledRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  padding: EdgeInsets.symmetric(horizontal: 50),
                  splashColor: Colors.yellowAccent[200],
                  onPressed: () => Navigator.push(context,
                      new MaterialPageRoute(builder: (_) => new Chap1Quiz()))),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(35.0),
            child: SizedBox(
              width: double.infinity,
              height: 90,
              child: FlatButton.icon(
                  label: Text(
                    'Game',
                    style: TextStyle(fontSize: 25.0),
                  ),
                  //textTheme: TextTheme(headline5: ),
                  color: Colors.redAccent[100],
                  icon: Icon(
                    Icons.games,
                    size: 30.0,
                  ),
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
