import 'dart:math';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fractastic/constants.dart';
import 'package:fractastic/model/User.dart';
import 'package:fractastic/ui/auth/AuthScreen.dart';
import 'package:fractastic/ui/services/Authenticate.dart';
import 'package:fractastic/ui/utils/helper.dart';
import 'package:image_picker/image_picker.dart';

import '../../main.dart';
import '../../constants.dart' as Constants;

FireStoreUtils _fireStoreUtils = FireStoreUtils();
String _newProfilePicURL =
    'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png';

class StudentHomeScreen extends StatefulWidget {
  final User user;

  StudentHomeScreen({Key key, @required this.user}) : super(key: key);

  @override
  State createState() {
    print(user.toString());
    return _StudentHomeState(user);
  }
}

class _StudentHomeState extends State<StudentHomeScreen> {
  final User user;

  _StudentHomeState(this.user);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: new Scaffold(
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
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
                accountName: Text(user.firstName + user.lastName),
                accountEmail: Text(user.email),
              ),
              ListTile(
                  leading: Icon(Icons.email, color: Colors.black),
                  title: Text('Guardian email',
                      style: TextStyle(color: Colors.black)),
                  subtitle: Text(user.guardianEmail,
                      style: TextStyle(color: Colors.black)),
                  trailing: IconButton(
                    icon: Icon(Icons.edit, color: Colors.black),
                    onPressed: () => _editGuardianEmail(),
                  )),
              ListTile(
                  leading: Icon(Icons.lock_outline, color: Colors.black),
                  title: Text('Change Password',
                      style: TextStyle(color: Colors.black))),
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
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(user.profilePictureURL),
              ),
            ],
          ),
        ),
      ),
    );
  }

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

  _editGuardianEmail() {}
}
