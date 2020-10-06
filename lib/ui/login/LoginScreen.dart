import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:fractastic/model/User.dart';
import 'package:fractastic/ui/home/HomeScreen.dart';
import 'package:fractastic/ui/services/Authenticate.dart';
import 'package:fractastic/ui/utils/helper.dart';

import '../../constants.dart' as Constants;
import '../../main.dart';

final _fireStoreUtils = FireStoreUtils();

class LoginScreen extends StatefulWidget {
  @override
  State createState() {
    return _LoginScreen();
  }
}

class _LoginScreen extends State<LoginScreen> {
  TextEditingController _emailController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();
  GlobalKey<FormState> _key = new GlobalKey();
  bool _validate = false;
  String email, password;

  User defaultUser;
// defaultUser.??? = ???
//need setter? maybe??

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0.0,
      ),
      body: Form(
        key: _key,
        autovalidate: _validate,
        child: ListView(
          children: <Widget>[
            Padding(
              padding:
                  const EdgeInsets.only(top: 32.0, right: 16.0, left: 16.0),
              child: Text(
                'Sign In',
                style: TextStyle(
                    color: Color(Constants.COLOR_PRIMARY),
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold),
              ),
            ),
            ConstrainedBox(
              constraints: BoxConstraints(minWidth: double.infinity),
              child: Padding(
                padding:
                    const EdgeInsets.only(top: 32.0, right: 24.0, left: 24.0),
                child: TextFormField(
                    textAlignVertical: TextAlignVertical.center,
                    textInputAction: TextInputAction.next,
                    validator: validateEmail,
                    onSaved: (String val) {
                      email = val;
                    },
                    onFieldSubmitted: (_) => FocusScope.of(context).nextFocus(),
                    controller: _emailController,
                    style: TextStyle(fontSize: 18.0),
                    keyboardType: TextInputType.emailAddress,
                    cursorColor: Color(Constants.COLOR_PRIMARY),
                    decoration: InputDecoration(
                        contentPadding:
                            new EdgeInsets.only(left: 16, right: 16),
                        fillColor: Colors.white,
                        hintText: 'E-mail Address',
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25.0),
                            borderSide: BorderSide(
                                color: Color(Constants.COLOR_PRIMARY),
                                width: 2.0)),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                        ))),
              ),
            ),
            ConstrainedBox(
              constraints: BoxConstraints(minWidth: double.infinity),
              child: Padding(
                padding:
                    const EdgeInsets.only(top: 32.0, right: 24.0, left: 24.0),
                child: TextFormField(
                    textAlignVertical: TextAlignVertical.center,
                    validator: validatePassword,
                    onSaved: (String val) {
                      password = val;
                    },
                    controller: _passwordController,
                    textInputAction: TextInputAction.done,
                    style: TextStyle(fontSize: 18.0),
                    cursorColor: Color(Constants.COLOR_PRIMARY),
                    decoration: InputDecoration(
                        contentPadding:
                            new EdgeInsets.only(left: 16, right: 16),
                        fillColor: Colors.white,
                        hintText: 'Password',
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25.0),
                            borderSide: BorderSide(
                                color: Color(Constants.COLOR_PRIMARY),
                                width: 2.0)),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                        ))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 40.0, left: 40.0, top: 40),
              child: ConstrainedBox(
                constraints: const BoxConstraints(minWidth: double.infinity),
                child: RaisedButton(
                  color: Color(Constants.COLOR_ACCENT),
                  child: Text(
                    'Log In',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  textColor: Colors.white,
                  splashColor: Color(Constants.COLOR_ACCENT),
                  onPressed: () async {
                    await onClick(
                        _emailController.text, _passwordController.text);
                  },
                  padding: EdgeInsets.only(top: 12, bottom: 12),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      side: BorderSide(color: Color(Constants.COLOR_ACCENT))),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(32.0),
              child: Center(
                child: Text(
                  'OR',
                  style: TextStyle(
                      fontSize: 16, color: Color(Constants.COLOR_WORDING)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 40.0, left: 40.0, top: 0),
              child: ConstrainedBox(
                constraints: const BoxConstraints(minWidth: double.infinity),
                child: RaisedButton(
                  color: Color(Constants.COLOR_ACCENT),
                  child: Text(
                    'Sign In Anonymous',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  textColor: Colors.white,
                  splashColor: Color(Constants.COLOR_ACCENT),
                  onPressed: () async {
                    await signIn();
                  },
                  padding: EdgeInsets.only(top: 12, bottom: 12),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      side: BorderSide(color: Color(Constants.COLOR_ACCENT))),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                MaterialButton(
                    child: Text(
                      'Forgot Password?',
                      style: TextStyle(
                          fontSize: 16, color: Color(Constants.COLOR_WORDING)),
                    ),
                    onPressed: () {
                      showAlertDialog(context, 'Forgot Password',
                          'Please contact our admin to retrieve your password.\n\nadmin@fractastic.com');
                    }),
              ],
            )
          ],
        ),
      ),
    );
  }

  Future signIn() async {
    try {
      showProgress(context, 'Logging in Anon, please wait...', false);
      User user = await loginAnonymous();
      if (user == null) user = defaultUser;
      pushAndRemoveUntil(context, HomeScreen(user: user), false);
    } catch (e) {
      print(e.toString());
    }
  }

  Future<User> loginAnonymous() async {
    try {
      User user = (await FirebaseAuth.instance.signInAnonymously()) as User;
      print("signed in anon as id : ${user.uid}");
      return user;
    } catch (exception) {
      print(exception.toString());
      return null;
    }
  }

  onClick(String email, String password) async {
    if (_key.currentState.validate()) {
      _key.currentState.save();
      showProgress(context, 'Logging in, please wait...', false);
      User user =
          await loginWithUserNameAndPassword(email.trim(), password.trim());
      if (user != null)
        pushAndRemoveUntil(context, HomeScreen(user: user), false);
    } else {
      setState(() {
        _validate = true;
      });
    }
  }

  Future<User> loginWithUserNameAndPassword(
      String email, String password) async {
    try {
      AuthResult result = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      DocumentSnapshot documentSnapshot = await FireStoreUtils.firestore
          .collection(Constants.USERS)
          .document(result.user.uid)
          .get();
      User user;
      if (documentSnapshot != null && documentSnapshot.exists) {
        user = User.fromJson(documentSnapshot.data);
        user.active = true;
        await _fireStoreUtils.updateCurrentUser(user, context);
        hideProgress();
        MyAppState.currentUser = user;
      }
      return user;
    } catch (exception) {
      hideProgress();
      switch ((exception as PlatformException).code) {
        case 'ERROR_INVALID_EMAIL':
          showAlertDialog(context, 'Error', 'Email address is malformed.');
          break;
        case 'ERROR_WRONG_PASSWORD':
          showAlertDialog(context, 'Error',
              'Password does not match. Please type in the correct password.');
          break;
        case 'ERROR_USER_NOT_FOUND':
          showAlertDialog(context, 'Error',
              'No user corresponding to the given email address. Please register first.');
          break;
        case 'ERROR_USER_DISABLED':
          showAlertDialog(context, 'Error', 'This user has been disabled');
          break;
        case 'ERROR_TOO_MANY_REQUESTS':
          showAlertDialog(context, 'Error',
              'There were too many attempts to sign in as this user.');
          break;
        case 'ERROR_OPERATION_NOT_ALLOWED':
          showAlertDialog(
              context, 'Error', 'Email & Password accounts are not enabled');
          break;
      }
      print(exception.toString());
      return null;
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}

loginAnonymous() {}
