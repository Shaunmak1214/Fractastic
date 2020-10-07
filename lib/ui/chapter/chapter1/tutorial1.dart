import 'package:flutter/material.dart';
import 'package:fractastic/ui/home/Profile.dart';

class Chap1Tutorial1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        child: Image(
            image:
                AssetImage('assets/images/intro-tutorial.png')),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightBlue[250],
        onPressed: () {},
        child: Text('done'),
      ),
    );
  }
}
