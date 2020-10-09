import 'package:flutter/material.dart';
import 'package:fractastic/ui/chapter/chapter1/game.dart';
import 'package:fractastic/ui/chapter/chapter2/quiz.dart';
import 'package:fractastic/ui/chapter/chapter2/tutorial.dart';

import '../../constants.dart' as Constants;

void main() => runApp(new MaterialApp(home: Chapter2OptionPage()));

class Chapter2OptionPage extends StatefulWidget {
  @override
  _Chapter2OptionPageState createState() => _Chapter2OptionPageState();
}

class _Chapter2OptionPageState extends State<Chapter2OptionPage> {
  dynamic status;
  Color cardColor = Colors.red;
  String quizProgress = 'Quiz isn\'t Completed';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chapter 2'),
        centerTitle: true,
        backgroundColor: Color(Constants.COLOR_PRIMARY),
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
                    style: TextStyle(fontSize: 25.0),
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
                      new MaterialPageRoute(builder: (_) => Chap2Tutorial()))),
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
                  onPressed: () async {
                    status = await Navigator.push(context,
                        new MaterialPageRoute(builder: (_) => new Chap2Quiz()));
                    setState(() {
                      cardColor = Colors.green;
                      quizProgress = 'Quiz Completed!';
                    });
                  },
                ),
              )),
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
          SizedBox(height: 50),
          Center(
            child: Container(
              margin: EdgeInsets.all(10.0),
              width: 250.0,
              height: 70.0,
              child: Card(
                color: cardColor,
                shape: StadiumBorder(
                  side: BorderSide(
                    color: Colors.transparent,
                    width: 3.0,
                  ),
                ),
                child: Center(
                  child: Text(quizProgress,
                      style: TextStyle(fontSize: 20, color: Colors.white)),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
