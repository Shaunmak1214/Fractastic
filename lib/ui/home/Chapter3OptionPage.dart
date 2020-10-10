import 'package:flutter/material.dart';
import 'package:fractastic/main.dart';
import 'package:fractastic/ui/chapter/chapter1/game.dart';
import 'package:fractastic/ui/chapter/chapter3/quiz.dart';
import 'package:fractastic/ui/chapter/chapter3/tutorial.dart';

import '../../constants.dart' as Constants;

class Chapter3OptionPage extends StatefulWidget {
  @override
  _Chapter3OptionPageState createState() => _Chapter3OptionPageState();
}

class _Chapter3OptionPageState extends State<Chapter3OptionPage> {
  dynamic status;
  Color cardColor = Colors.red;
  String quizProgress = 'Quiz isn\'t Completed';
  @override
  void initState() {
    if (MyAppState.currentUser.quizCount >= 3) {
      cardColor = Colors.green;
      quizProgress = 'Quiz Completed!';
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chapter 3'),
        centerTitle: true,
        backgroundColor: Color(Constants.COLOR_PRIMARY),
        // leading: new IconButton(
        //   icon: new Icon(Icons.arrow_back),
        //   onPressed: () => Navigator.of(context).pop(),
        // ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(60, 70, 60, 20),
              child: Container(
                width: double.infinity,
                height: 80,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: <Color>[
                      Color(0xFF3D5AFE),
                      Color(0xFF59DDD5),
                    ],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                  borderRadius: BorderRadius.circular(60),
                ),
                child: FlatButton.icon(
                    label: Text(
                      ' Tutorial',
                      style: TextStyle(
                        fontSize: 30.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    icon: Icon(
                      Icons.library_books,
                      size: 35.0,
                      color: Colors.white,
                    ),
                    onPressed: () => Navigator.push(
                        context,
                        new MaterialPageRoute(
                            builder: (_) => Chap3Tutorial()))),
              ),
            ),
            Padding(
                padding: const EdgeInsets.fromLTRB(60, 20, 60, 20),
                child: Container(
                  width: double.infinity,
                  height: 80,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: <Color>[
                        Color(0xFF1B7E79),
                        Color(0xFFD3F351),
                      ],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                    borderRadius: BorderRadius.circular(60),
                  ),
                  child: FlatButton.icon(
                    label: Text(
                      'Quiz',
                      style: TextStyle(
                        fontSize: 30.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    icon: Icon(
                      Icons.lightbulb_outline,
                      size: 37.0,
                      color: Colors.white,
                    ),
                    onPressed: () async {
                      status = await Navigator.push(
                          context,
                          new MaterialPageRoute(
                              builder: (_) => new Chap3Quiz()));
                      setState(() {
                        if (status == 1) {
                          cardColor = Colors.green;
                          quizProgress = 'Quiz Completed!';
                        }
                      });
                    },
                  ),
                )),
            Padding(
              padding: const EdgeInsets.fromLTRB(60, 20, 60, 20),
              child: Container(
                width: double.infinity,
                height: 80,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: <Color>[Color(0xFF1960B5E), Color(0xFFFF7272)],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                  borderRadius: BorderRadius.circular(60),
                ),
                child: FlatButton.icon(
                    label: Text(
                      ' Game',
                      style: TextStyle(
                          fontSize: 30.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    icon: Icon(
                      Icons.games,
                      size: 35.0,
                      color: Colors.white,
                    ),
                    onPressed: () => Navigator.push(context,
                        new MaterialPageRoute(builder: (_) => Chap1game1()))),
              ),
            ),
            SizedBox(height: 40),
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
      ),
    );
  }
}
