import 'package:flutter/material.dart';
import 'package:fractastic/ui/home/Profile.dart';

class Chap2Tutorial1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: new Scaffold(
        appBar: AppBar(
          title: Text('Chapter 1'),
          centerTitle: true,
          backgroundColor: Colors.lightBlue[250],
          leading: new IconButton(
            icon: new Icon(Icons.arrow_back),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        body: Center(
          child: Image(image: AssetImage('assets/chap2-tutorial1.png')),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.lightBlue[250],
          onPressed: () {},
          child: Text('done'),
        ),
      ),
    );
  }
}
