import 'package:flutter/material.dart';
import 'package:fractastic/ui/signUp/SignUpScreen.dart';

class SignUpIdentity extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                print('I got clicked');
                //Navigator.popAndPushNamed(context, "/signUp/SignUpScreen");
                Navigator.pop(context);
                Navigator.push(context,
                    new MaterialPageRoute(builder: (_) => SignUpScreen()));
              },
              child: Image.asset('assets/images/Teacher.png'),
            ),
            SizedBox(width: 50.0),
            FlatButton(
              onPressed: () {
                print('I got clicked');
                // Navigator.popAndPushNamed(context, "/lib/signUp/SignUpScreen");
                Navigator.pop(context);
                Navigator.push(context,
                    new MaterialPageRoute(builder: (_) => SignUpScreen()));
              },
              child: Image.asset('assets/images/Student.png'),
            ),
          ],
        ),
      ),
    );
  }
}
