import 'package:flutter/material.dart';

class Tutorial extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: new Scaffold(
        appBar: AppBar(
          title: Text('Chapter 1'),
          centerTitle: true,
          backgroundColor: Colors.lightBlue[250],
        ),
        body: Center(
          child: Image(image: AssetImage('assets/Tutorial1.png')),
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
