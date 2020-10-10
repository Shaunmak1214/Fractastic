import 'dart:math';

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
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import '../../constants.dart' as Constants;

FireStoreUtils _fireStoreUtils = FireStoreUtils();
String _newProfilePicURL =
    'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png';

class StudentScreen extends StatefulWidget {
  final User user;

  StudentScreen({Key key, @required this.user}) : super(key: key);

  @override
  _StudentScreenState createState() => _StudentScreenState(user);
}

class _StudentScreenState extends State<StudentScreen> {
  final _formKey = GlobalKey<FormState>();
  final User user;
  _StudentScreenState(this.user);

  String _currentFirstName;
  String _currentLastName;
  String _currentPassword;
  String _currentGuardianEmail;

  int currentIndex = 0;

  List<Widget> _widgetOptions = <Widget>[
    //StudentHomeScreen(),
    Wrapper(),
    QuizResult(),
    CalendarPage(),
  ];

  @override
  Widget build(BuildContext context) {
    FireStoreUtils.classCollection.snapshots().listen((snapshot) {
      MyAppState.classCodeList = snapshot.documents.map((doc) {
        return Class.fromJson(doc.data).classCode;
      }).toList();
    });

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        drawer: Drawer(
          child: Column(
            children: [
              UserAccountsDrawerHeader(
                decoration: BoxDecoration(
                  color: Color(COLOR_PRIMARY),
                ),
                currentAccountPicture: GestureDetector(
                  onTap: () => _onCameraClick(),
                  child: CircleAvatar(
                    radius: 50.0,
                    backgroundColor: const Color(0xFF778899),
                    backgroundImage: NetworkImage(user.profilePictureURL),
                  ),
                ),
                accountName: Text(user.firstName + ' ' + user.lastName),
                accountEmail: Text(user.email),
              ),
              ListTile(
                  leading: Icon(Icons.mail_outline, color: Colors.black),
                  title: Text('Guardian email',
                      style: TextStyle(color: Colors.black)),
                  subtitle: Text(user.guardianEmail,
                      style: TextStyle(color: Colors.black)),
                  trailing: IconButton(
                    icon: Icon(Icons.edit, color: Colors.black),
                    onPressed: () => __asyncGuardianEmailInputDialog(context),
                  )),
              SizedBox(
                height: 20.0,
              ),
              ListTile(
                  leading: Icon(Icons.person_outline, color: Colors.black),
                  title: Text('Change Name',
                      style: TextStyle(color: Color(Constants.COLOR_WORDING))),
                  onTap: () async {
                    await _asyncNameInputDialog(context);
                  }),
              ListTile(
                  leading: Icon(Icons.lock_outline, color: Colors.black),
                  title: Text('Change Password',
                      style: TextStyle(color: Color(Constants.COLOR_WORDING))),
                  onTap: () async {
                    await _asyncPasswordInputDialog(context);
                  }),
              ListTile(
                  leading: Icon(Icons.data_usage, color: Colors.black),
                  title: Text('View Learning Progress',
                      style: TextStyle(color: Colors.orange)),
                  onTap: () {
                    Navigator.push(
                        context,
                        new MaterialPageRoute(
                            builder: (_) => LearningProgress(user: user)));
                  }),
              ListTile(
                leading: Transform.rotate(
                    angle: pi / 1,
                    child: Icon(Icons.exit_to_app, color: Colors.black)),
                title: Text(
                  'Logout',
                  style: TextStyle(color: Colors.red[400]),
                ),
                onTap: () async {
                  user.active = false;
                  user.lastOnlineTimestamp = Timestamp.now();
                  _fireStoreUtils.updateCurrentUser(user, context);
                  await FirebaseAuth.instance.signOut();
                  MyAppState.currentUser = null;
                  pushAndRemoveUntil(context, AuthScreen(), false);
                },
              ),
              Spacer(),
              ListTile(
                leading: Icon(Icons.help_outline, color: Colors.black),
                title: Text('Contact Us',
                    style:
                        TextStyle(color: Color(Constants.COLOR_PRIMARY_DARK))),
                onTap: () {
                  showAlertDialog(context, 'Fractastic Business Email',
                      'admin@fractastic.com');
                },
              ),
            ],
          ),
        ),
        appBar: AppBar(
          title: Text(
            'Fractastic',
            style: TextStyle(color: Colors.black),
          ),
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Color(Constants.COLOR_PRIMARY),
          centerTitle: true,
        ),
        bottomNavigationBar: BottomNavyBar(
          selectedIndex: currentIndex,
          onItemSelected: (index) {
            setState(
              () {
                currentIndex = index;
              },
            );
          },
          items: <BottomNavyBarItem>[
            BottomNavyBarItem(
              icon: Icon(Icons.home),
              title: Text('Home'),
              activeColor: Colors.redAccent,
              inactiveColor: Colors.blueGrey[300],
            ),
            BottomNavyBarItem(
              icon: Icon(Icons.description),
              title: Text('Quiz Results'),
              activeColor: Colors.deepPurpleAccent,
              inactiveColor: Colors.blueGrey[300],
            ),
            BottomNavyBarItem(
              icon: Icon(Icons.calendar_today),
              title: Text('Calendar'),
              activeColor: Colors.deepOrangeAccent,
              inactiveColor: Colors.blueGrey[300],
            )
          ],
        ),
        body: _widgetOptions.elementAt(currentIndex),

        //only homescreen got join class
      ),
    );
  }

  // Future<String> _createAlertDialog(BuildContext context) {
  //   TextEditingController customController = TextEditingController();

  //   return showDialog(
  //     context: context,
  //     builder: (context) {
  //       return AlertDialog(
  //         title: Text(
  //           'Enter Your Class Code:',
  //           style: TextStyle(color: Color(Constants.COLOR_WORDING)),
  //         ),
  //         content: TextField(
  //           controller: customController,
  //         ),
  //         actions: <Widget>[
  //           MaterialButton(
  //             elevation: 5.0,
  //             child: Text(
  //               'Submit',
  //               style: TextStyle(color: Color(Constants.COLOR_WORDING)),
  //             ),
  //             onPressed: () {
  //               Navigator.of(context).pop(customController.text.toString());
  //             },
  //           )
  //         ],
  //       );
  //     },
  //   );
  // }

  _onCameraClick() {
    final action = CupertinoActionSheet(
      message: Text(
        "Add profile picture",
        style: TextStyle(fontSize: 15.0),
      ),
      actions: <Widget>[
        CupertinoActionSheetAction(
          child: Text("Choose from gallery"),
          isDefaultAction: false,
          onPressed: () async {
            Navigator.pop(context);
            var newImage =
                await ImagePicker.pickImage(source: ImageSource.gallery);
            if (newImage != null) {
              updateProgress('Uploading image...');
              _newProfilePicURL = await FireStoreUtils()
                  .uploadUserImageToFireStorage(newImage, user.uid);
            }
            setState(() {
              user.profilePictureURL = _newProfilePicURL;
            });
          },
        ),
        CupertinoActionSheetAction(
          child: Text("Take a picture"),
          isDestructiveAction: false,
          onPressed: () async {
            Navigator.pop(context);
            var newImage =
                await ImagePicker.pickImage(source: ImageSource.camera);
            if (newImage != null) {
              updateProgress('Uploading image...');
              _newProfilePicURL = await FireStoreUtils()
                  .uploadUserImageToFireStorage(newImage, user.uid);
            }
            setState(() {
              user.profilePictureURL = _newProfilePicURL;
            });
          },
        )
      ],
      cancelButton: CupertinoActionSheetAction(
        child: Text("Cancel"),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
    showCupertinoModalPopup(context: context, builder: (context) => action);
  }

  Future __asyncGuardianEmailInputDialog(BuildContext context) async {
    return showDialog(
      context: context,
      barrierDismissible:
          true, // dialog is dismissible with a tap on the barrier
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Change Guardian Email'),
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
                        initialValue: user.guardianEmail,
                        decoration: InputDecoration(
                          hintText: 'New Guardian Email',
                          contentPadding:
                              EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                        ),
                        validator: validateEmail,
                        onChanged: (val) =>
                            setState(() => _currentGuardianEmail = val),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: RaisedButton(
                        child: Text("Update"),
                        onPressed: () async {
                          if (_formKey.currentState.validate()) {
                            setState(() {
                              user.guardianEmail =
                                  _currentGuardianEmail ?? user.guardianEmail;
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

  Future _asyncNameInputDialog(BuildContext context) async {
    return showDialog(
      context: context,
      barrierDismissible:
          true, // dialog is dismissible with a tap on the barrier
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Change Name'),
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
                        initialValue: user.firstName,
                        decoration: InputDecoration(
                          hintText: 'First Name',
                          contentPadding:
                              EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                        ),
                        validator: validateName,
                        onChanged: (val) =>
                            setState(() => _currentFirstName = val),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: TextFormField(
                        initialValue: user.lastName,
                        decoration: InputDecoration(
                          hintText: 'Last Name',
                          contentPadding:
                              EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                        ),
                        validator: validateName,
                        onChanged: (val) =>
                            setState(() => _currentLastName = val),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: RaisedButton(
                        child: Text("Update"),
                        onPressed: () async {
                          if (_formKey.currentState.validate()) {
                            setState(() {
                              user.firstName =
                                  _currentFirstName ?? user.firstName;
                              user.lastName = _currentLastName ?? user.lastName;
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

  Future _asyncPasswordInputDialog(BuildContext context) async {
    return showDialog(
      context: context,
      barrierDismissible:
          true, // dialog is dismissible with a tap on the barrier
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Change Password'),
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
                          hintText: 'New Password',
                          contentPadding:
                              EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                        ),
                        validator: validatePassword,
                        onChanged: (val) =>
                            setState(() => _currentPassword = val),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: RaisedButton(
                        child: Text("Update"),
                        onPressed: () async {
                          if (_formKey.currentState.validate()) {
                            setState(() {
                              user.password = _currentPassword ?? user.password;
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
