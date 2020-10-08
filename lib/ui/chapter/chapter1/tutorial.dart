import 'package:flutter/material.dart';
import '../../../constants.dart' as Constants;

class Chap1Tutorial extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chapter 1'),
        centerTitle: true,
        backgroundColor: Color(Constants.COLOR_PRIMARY),
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Center(
          child: SingleChildScrollView(
              child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Image(image: AssetImage('assets/images/intro-tutorial.png')),
          new Image(image: AssetImage('assets/images/chap1-tutorial2.png')),
          new Image(image: AssetImage('assets/images/chap1-tutorial3.png')),
          Padding(
            padding: EdgeInsets.all(15.0),
          )
        ],
      ))),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(Constants.COLOR_ACCENT),
        onPressed: () => Navigator.of(context).pop(),
        child: Icon(Icons.done),
      ),
    );
  }
}
