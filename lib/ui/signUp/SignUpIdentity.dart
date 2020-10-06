import 'package:flutter/material.dart';

class SignUpIdentity extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: new Scaffold(
        appBar: AppBar(
          title: Text("Choose your identity"),
          textTheme: Theme.of(context).textTheme.apply(
                bodyColor: Colors.black,
                displayColor: Colors.black,
              ),
          centerTitle: true,
          backgroundColor: Colors.white,
        ),
        backgroundColor: Colors.white54,
        body: Padding(
          padding: const EdgeInsets.all(75.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(width: 50.0),
              FlatButton(
                onPressed: () {
                  //Navigator.popAndPushNamed(context, "/SignUpScreen");
                  print('I got clicked');
                },
                child: Image.asset('assets/Teacher.png'),
              ),
              SizedBox(width: 50.0),
              FlatButton(
                onPressed: () {
                  print('I got clicked');
                  //Navigator.popAndPushNamed(context, "/SignUpScreen");
                },
                child: Image.asset('assets/Student.png'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
