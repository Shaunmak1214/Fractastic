import 'package:flutter/material.dart';

class QuizResult extends StatefulWidget {
  @override
  _QuizResultState createState() => _QuizResultState();
}

class _QuizResultState extends State<QuizResult> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('View Result'),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            new Padding(
              padding: const EdgeInsets.all(8.0),
            ),
            new ListTile(
                leading: Icon(Icons.person),
                // trailing: Icon(Icons.done_all),
                title: Text("student name"),
                onTap: () => showDialog(
                      context: context,
                      builder: (BuildContext context) => new AlertDialog(
                        title: new Text("Student Result"),
                        content: new ListTile(
                          title: Text("3 Over 5 Marks"),
                          subtitle: Text("Chapter 1"),

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
