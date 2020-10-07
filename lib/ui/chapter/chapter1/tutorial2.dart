import 'package:flutter/material.dart';
import 'package:fractastic/ui/home/Profile.dart';

class Chap1Tutorial2 extends StatelessWidget {
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
          // onPressed: () {
          //   Navigator.push(
          //     context,
          //     MaterialPageRoute(builder: (context) => Profile()),
          //   );
          //},
        ),
      ),
      body: Center(
        child: Image(image: AssetImage('assets/chap1-tutorial2.png')),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightBlue[250],
        onPressed: () {},
        child: Text('done'),
      ),
    );
  }
}
