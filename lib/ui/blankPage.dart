import 'package:flutter/material.dart';
import 'package:fractastic/constants.dart' as Constants;

void main() => runApp(MaterialApp(
      home: Home(),
    ));

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Fractastic'),
          centerTitle: true,
          backgroundColor: Color(Constants.COLOR_PRIMARY)),
      body: new Column(
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: SizedBox(height: 60.0),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: new Image(
              image: AssetImage('assets/images/construction.png'),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(Constants.COLOR_ACCENT),
        child: Text('Back'),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
    );
  }
}
