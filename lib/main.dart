import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fractastic/model/User.dart';
import 'package:fractastic/ui/student/StudentScreen.dart';
import 'package:fractastic/ui/teacher/TeacherScreen.dart';
import 'package:fractastic/ui/services/Authenticate.dart';
import 'package:fractastic/ui/utils/helper.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'constants.dart' as Constants;
import 'ui/auth/AuthScreen.dart';
import 'ui/onBoarding/OnBoardingScreen.dart';

void main() => runApp(new MyApp());

class MyApp extends StatefulWidget {
  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> with WidgetsBindingObserver {
  static User currentUser;
  static List<String> classCodeList = new List<String>();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Color(Constants.COLOR_PRIMARY_DARK)));
    return MaterialApp(
        theme: ThemeData(accentColor: Color(Constants.COLOR_PRIMARY)),
        debugShowCheckedModeBanner: false,
        color: Color(Constants.COLOR_PRIMARY),
        home: OnBoarding());
  }

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (FirebaseAuth.instance.currentUser() != null && currentUser != null) {
      if (state == AppLifecycleState.paused) {
        //user offline
        currentUser.active = false;
        currentUser.lastOnlineTimestamp = Timestamp.now();
        FireStoreUtils.currentUserDocRef.updateData(currentUser.toJson());
      } else if (state == AppLifecycleState.resumed) {
        //user online
        currentUser.active = true;
        FireStoreUtils.currentUserDocRef.updateData(currentUser.toJson());
      }
    }
  }
}

class OnBoarding extends StatefulWidget {
  @override
  State createState() {
    return OnBoardingState();
  }
}

class OnBoardingState extends State<OnBoarding> {
  Future hasFinishedOnBoarding() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool finishedOnBoarding =
        (prefs.getBool(Constants.FINISHED_ON_BOARDING) ?? false);

    if (finishedOnBoarding) {
      FirebaseUser firebaseUser = await FirebaseAuth.instance.currentUser();
      if (firebaseUser != null) {
        User user = await FireStoreUtils().getCurrentUser(firebaseUser.uid);
        if (user != null) {
          MyAppState.currentUser = user;
          if (user.userType == 'Student')
            pushReplacement(context, StudentScreen(user: user));
          else
            pushReplacement(context, TeacherScreen(user: user));
        } else {
          pushReplacement(context, new AuthScreen());
        }
      } else {
        pushReplacement(context, new AuthScreen());
      }
    } else {
      pushReplacement(context, new OnBoardingScreen());
    }
  }

  @override
  void initState() {
    super.initState();
    hasFinishedOnBoarding();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(Constants.COLOR_PRIMARY),
      body: Center(
        child: CircularProgressIndicator(
          backgroundColor: Colors.white,
        ),
      ),
    );
  }
}
