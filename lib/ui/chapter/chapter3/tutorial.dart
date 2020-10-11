import 'package:flutter/material.dart';
import '../../../constants.dart' as Constants;

class Chap3Tutorial extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chapter 3'),
        centerTitle: true,
        backgroundColor: Color(Constants.COLOR_PRIMARY),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Center(
          child: SingleChildScrollView(
              child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image(image: AssetImage('assets/images/chap3-tutorial1.png')),
          Image(image: AssetImage('assets/images/chap3-tutorial2.png')),
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
