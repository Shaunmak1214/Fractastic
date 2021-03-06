import 'package:flutter/material.dart';
import 'package:fractastic/main.dart';
import '../chapter/chapter1/quiz.dart';
import '../chapter/chapter2/quiz.dart';
import '../chapter/chapter3/quiz.dart';

class QuizResult extends StatefulWidget {
  @override
  _QuizResultState createState() => _QuizResultState();
}

class _QuizResultState extends State<QuizResult> {
  @override
  Widget build(BuildContext context) {
    var result4;
    return Scaffold(
      // appBar: AppBar(
      //   leading: Icon(Icons.thumbs_up_down),
      //   title: Text('View Result'),
      //   centerTitle: true,
      //   backgroundColor: Colors.redAccent,
      // ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: Container(
                margin: EdgeInsets.fromLTRB(0.0, 25.0, 0.0, 10.0),
                padding: EdgeInsets.fromLTRB(15.0, 8.0, 15.0, 8.0),
                decoration: BoxDecoration(
                  border: Border.all(width: 2, color: Colors.deepPurpleAccent),
                  borderRadius: BorderRadius.circular(25.0),
                  color: Colors.deepPurpleAccent,
                ),
                child: Text(
                  'Quiz Results',
                  style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ),
            new ListTile(
                leading: Icon(
                  Icons.receipt,
                  color: Colors.red,
                ),
                // trailing: Icon(Icons.done_all),
                title: Text("Chapter 1 Result"),
                onTap: () => showDialog(
                      context: context,
                      barrierDismissible: true,
                      builder: (BuildContext context) => new AlertDialog(
                        title: new Text("Student Result"),
                        content: new ListTile(
                          title: MyAppState.currentUser.result == null
                              ? Text('Quiz isn\'t completed')
                              : Text(
                                  "${MyAppState.currentUser.result}  Over 5 Marks"),
                          subtitle:
                              Text("Chapter 1 : Introduction to Fraction"),

                          /// print result list
                        ),
                        actions: <Widget>[
                          FlatButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text('Close'))
                        ],
                      ),
                    )),
            new ListTile(
                leading: Icon(
                  Icons.receipt,
                  color: Colors.orange,
                ),
                // trailing: Icon(Icons.done_all),
                title: Text("Chapter 2 Result"),
                onTap: () => showDialog(
                      context: context,
                      barrierDismissible: true,
                      builder: (BuildContext context) => new AlertDialog(
                        title: new Text("Student Result"),
                        content: new ListTile(
                          title: MyAppState.currentUser.result2 == null
                              ? Text('Quiz isn\'t completed')
                              : Text(
                                  "${MyAppState.currentUser.result2}  Over 5 Marks"),
                          subtitle: Text("Chapter 2 : Basic of Fraction"),

                          /// print result list
                        ),
                        actions: <Widget>[
                          FlatButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text('Close'))
                        ],
                      ),
                    )),
            new ListTile(
                leading: Icon(
                  Icons.receipt,
                  color: Colors.yellow,
                ),
                // trailing: Icon(Icons.done_all),
                title: Text("Chapter 3 Result"),
                onTap: () => showDialog(
                      context: context,
                      barrierDismissible: true,
                      builder: (BuildContext context) => new AlertDialog(
                        title: new Text("Student Result"),
                        content: new ListTile(
                          title: MyAppState.currentUser.result3 == null
                              ? Text('Quiz isn\'t completed')
                              : Text(
                                  "${MyAppState.currentUser.result3}  Over 5 Marks"),
                          subtitle: Text("Chapter 3 : Conversion of Fraction"),

                          /// print result list
                        ),
                        actions: <Widget>[
                          FlatButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text('Close'))
                        ],
                      ),
                    )),
            new ListTile(
                leading: Icon(
                  Icons.receipt,
                  color: Colors.green,
                ),
                // trailing: Icon(Icons.done_all),
                title: Text("Chapter 4 Result"),
                onTap: () => showDialog(
                      context: context,
                      barrierDismissible: true,
                      builder: (BuildContext context) => new AlertDialog(
                        title: new Text("Student Result"),
                        content: new ListTile(
                          title: result4 == null
                              ? Text('Quiz isn\'t completed')
                              : Text("$result4  Over 5 Marks"),
                          subtitle: Text("Chapter 4 : Adding of Fraction"),

                          /// print result list
                        ),
                        actions: <Widget>[
                          FlatButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text('Close'))
                        ],
                      ),
                    )),
            new ListTile(
                leading: Icon(
                  Icons.receipt,
                  color: Colors.blue,
                ),
                // trailing: Icon(Icons.done_all),
                title: Text("Chapter 5 Result"),
                onTap: () => showDialog(
                      context: context,
                      barrierDismissible: true,
                      builder: (BuildContext context) => new AlertDialog(
                        title: new Text("Student Result"),
                        content: new ListTile(
                          title: result4 == null
                              ? Text('Quiz isn\'t completed')
                              : Text("$result4  Over 5 Marks"),
                          subtitle: Text("Chapter 5 : Subtracting of Fraction"),

                          /// print result list
                        ),
                        actions: <Widget>[
                          FlatButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text('Close'))
                        ],
                      ),
                    )),
            new ListTile(
                leading: Icon(
                  Icons.receipt,
                  color: Colors.indigo,
                ),
                // trailing: Icon(Icons.done_all),
                title: Text("Chapter 6 Result"),
                onTap: () => showDialog(
                      context: context,
                      barrierDismissible: true,
                      builder: (BuildContext context) => new AlertDialog(
                        title: new Text("Student Result"),
                        content: new ListTile(
                          title: result4 == null
                              ? Text('Quiz isn\'t completed')
                              : Text("$result4  Over 5 Marks"),
                          subtitle: Text("Chapter 6 : Multiplying of Fraction"),

                          /// print result list
                        ),
                        actions: <Widget>[
                          FlatButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text('Close'))
                        ],
                      ),
                    )),
            new ListTile(
                leading: Icon(
                  Icons.receipt,
                  color: Colors.purple,
                ),
                // trailing: Icon(Icons.done_all),
                title: Text("Chapter 7 Result"),
                onTap: () => showDialog(
                      context: context,
                      barrierDismissible: true,
                      builder: (BuildContext context) => new AlertDialog(
                        title: new Text("Student Result"),
                        content: new ListTile(
                          title: result4 == null
                              ? Text('Quiz isn\'t completed')
                              : Text("$result4  Over 5 Marks"),
                          subtitle: Text("Chapter 7 : Dividing of Fraction"),

                          /// print result list
                        ),
                        actions: <Widget>[
                          FlatButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text('Close'))
                        ],
                      ),
                    )),
          ],
        ),
      ),
    );
  }
}
