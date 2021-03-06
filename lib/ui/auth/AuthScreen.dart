import 'package:flutter/material.dart';
import 'package:fractastic/ui/login/SignInIdentity.dart';
import 'package:fractastic/ui/signUp/SignUpIdentity.dart';
import 'package:fractastic/ui/utils/helper.dart';

import '../../constants.dart' as Constants;

class AuthScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 200.0, bottom: 20.0),
                child: Image.asset(
                  'assets/images/logo_ver1.png',
                  //color: Color(Constants.COLOR_PRIMARY),
                  width: 90,
                  height: 90,
                ),
              ),
            ),
            Text(
              'Welcome to Fractastic!',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Color(Constants.COLOR_PRIMARY),
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'New user? Please sign up.',
                style: TextStyle(fontSize: 15),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 40.0, left: 40.0, top: 20),
              child: ConstrainedBox(
                constraints: const BoxConstraints(minWidth: double.infinity),
                child: RaisedButton(
                  color: Color(Constants.COLOR_PRIMARY),
                  child: Text(
                    'Log In',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  textColor: Colors.white,
                  splashColor: Color(Constants.COLOR_PRIMARY),
                  onPressed: () {
                    push(context, new SignInIdentity());
                  },
                  padding: EdgeInsets.only(top: 12, bottom: 12),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      side: BorderSide(color: Color(Constants.COLOR_PRIMARY))),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 40.0, left: 40.0, top: 20),
              child: ConstrainedBox(
                constraints: const BoxConstraints(minWidth: double.infinity),
                child: FlatButton(
                  textColor: Colors.black54,
                  child: Text(
                    'Sign Up',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  onPressed: () {
                    push(context, new SignUpIdentity());
                  },
                  padding: EdgeInsets.only(top: 12, bottom: 12),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      side: BorderSide(color: Colors.black54)),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
