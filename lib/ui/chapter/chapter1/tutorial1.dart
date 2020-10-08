import 'package:flutter/material.dart';
import 'package:fractastic/ui/home/Profile.dart';
import '../../../constants.dart' as Constants;

class Chap1Tutorial1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chapter 1'),
        centerTitle: true,
        backgroundColor: Color(Constants.COLOR_ACCENT),
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Center(
        child: Image(image: AssetImage('assets/images/intro-tutorial.png')),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(Constants.COLOR_ACCENT),
        onPressed: () => Navigator.of(context).pop(),
        child: Text('done'),
      ),
    );
  }
}
