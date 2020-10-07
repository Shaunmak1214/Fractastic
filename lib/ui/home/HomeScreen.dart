import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fractastic/constants.dart';
import 'package:fractastic/model/User.dart';
import 'package:fractastic/ui/auth/AuthScreen.dart';
import 'package:fractastic/ui/home/ChapterOptionPage.dart';
import 'package:fractastic/ui/services/Authenticate.dart';
import 'package:fractastic/ui/utils/helper.dart';

import '../../main.dart';
import '../../constants.dart' as Constants;

FireStoreUtils _fireStoreUtils = FireStoreUtils();

class HomeScreen extends StatefulWidget {
  final User user;

  HomeScreen({Key key, @required this.user}) : super(key: key);

  @override
  State createState() {
    print(user.toString());
    return _HomeState(user);
  }
}

class _HomeState extends State<HomeScreen> {
  final User user;

  _HomeState(this.user);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: new Scaffold(
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                child: Text(
                  'Drawer Header',
                  style: TextStyle(color: Colors.white),
                ),
                decoration: BoxDecoration(
                  color: Color(COLOR_PRIMARY),
                ),
              ),
              ListTile(
                title: Text(
                  'Logout',
                  style: TextStyle(color: Colors.black),
                ),
                leading: Transform.rotate(
                    angle: pi / 1,
                    child: Icon(Icons.exit_to_app, color: Colors.black)),
                onTap: () async {
                  user.active = false;
                  user.lastOnlineTimestamp = Timestamp.now();
                  _fireStoreUtils.updateCurrentUser(user, context);
                  await FirebaseAuth.instance.signOut();
                  MyAppState.currentUser = null;
                  pushAndRemoveUntil(context, AuthScreen(), false);
                },
              ),
            ],
          ),
        ),
        appBar: AppBar(
          title: Text(
            'Home',
            style: TextStyle(color: Colors.black),
          ),
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Color(Constants.COLOR_PRIMARY),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              displayCircleImage(user.profilePictureURL, 125, false),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(user.firstName),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(user.email),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(user.guardianEmail),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(user.userID),
              ),
              RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: BorderSide(color: Colors.red)),
                onPressed: () {
                  Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (_) => ChapterOptionPage()));
                },
                color: Colors.red,
                textColor: Colors.white,
                child: Text("chapter 1".toUpperCase(),
                    style: TextStyle(fontSize: 14)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
