import 'package:flutter/material.dart';
import '../../constants.dart' as Constants;

class ResultPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('View Result'),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
        // leading: new IconButton(
        //   icon: new Icon(Icons.arrow_back),
        //   onPressed: () => Navigator.of(context).pop(),
        // ),
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
              onTap: () => new AlertDialog(
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
            ),
          ],
        ),
      ),
    );
  }
}
