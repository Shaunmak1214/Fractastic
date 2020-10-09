import 'package:flutter/material.dart';
import 'package:fractastic/ui/home/Profile.dart';

class Chap2Tutorial1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: new Scaffold(
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
          child: Image(image: AssetImage('assets/images/chap2-tutorial1.png')),
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
