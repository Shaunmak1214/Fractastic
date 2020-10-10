import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fractastic/constants.dart';
import 'package:fractastic/model/Class.dart';
import 'package:fractastic/model/User.dart';
import 'package:fractastic/ui/auth/AuthScreen.dart';
import 'package:fractastic/ui/home/LearningProgress.dart';
import 'package:fractastic/ui/scheduleCalendar.dart';
import 'package:fractastic/ui/home/QuizResult.dart';
import 'package:fractastic/ui/services/Authenticate.dart';
import 'package:fractastic/ui/student/Wrapper.dart';
import 'package:fractastic/ui/utils/helper.dart';
import 'package:image_picker/image_picker.dart';

import '../../main.dart';
import 'package:fractastic/constants.dart' as Constants;

FireStoreUtils _fireStoreUtils = FireStoreUtils();

class NoClassPage extends StatefulWidget {
  @override
  _NoClassPageState createState() => _NoClassPageState();
}

class _NoClassPageState extends State<NoClassPage> {
  final _formKey = GlobalKey<FormState>();
  String _currentClassCode;
  User user = MyAppState.currentUser;

  @override
  Widget build(BuildContext context) {
    FireStoreUtils.classCollection.snapshots().listen((snapshot) {
      MyAppState.classCodeList = snapshot.documents.map((doc) {
        return Class.fromJson(doc.data).classCode;
      }).toList();
    });
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Center(
        child: Column(
          children: [
            Image.asset(
              'assets/images/noClass.png',
            ),
            Padding(padding: EdgeInsets.only(top: 15.0)),
            Image.asset(
              'assets/images/noClass2.png',
            ),
          ],
          mainAxisAlignment: MainAxisAlignment.center,
        ),
      ),
      floatingActionButton: Container(
        height: 60.0,
        width: 60.0,
        child: FittedBox(
          child: FloatingActionButton(
              child: Icon(Icons.add),
              backgroundColor: Color(Constants.COLOR_ACCENT),
              onPressed: () {
                _asyncJoinClassDialog(context);
              }),
        ),
      ),
    );
  }

  Future _asyncJoinClassDialog(BuildContext context) async {
    return showDialog(
      context: context,
      barrierDismissible:
          true, // dialog is dismissible with a tap on the barrier
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Join Class'),
          content: Stack(
            overflow: Overflow.visible,
            children: <Widget>[
              Positioned(
                right: -40.0,
                top: -80.0,
                child: InkResponse(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: CircleAvatar(
                    child: Icon(Icons.close),
                    backgroundColor: Colors.red,
                  ),
                ),
              ),
              Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Class code',
                          contentPadding:
                              EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                        ),
                        validator: validateClassCode,
                        onChanged: (val) =>
                            setState(() => _currentClassCode = val),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: RaisedButton(
                        child: Text("Join"),
                        onPressed: () async {
                          if (_formKey.currentState.validate()) {
                            setState(() {
                              user.classCode =
                                  _currentClassCode ?? user.classCode;
                            });
                            await _fireStoreUtils.updateCurrentUser(
                                user, context);
                            Navigator.pop(context);
                          }
                        },
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
