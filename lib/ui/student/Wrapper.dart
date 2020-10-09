import 'package:flutter/material.dart';
import 'package:fractastic/ui/home/ChapterListScreen.dart';
import 'package:fractastic/model/Class.dart';
import 'package:fractastic/ui/services/Authenticate.dart';
import 'package:fractastic/ui/student/NoClassPage.dart';
import '../../main.dart';

FireStoreUtils _fireStoreUtils = FireStoreUtils();
String classCode = '';

class Wrapper extends StatefulWidget {
  Wrapper({Key key}) : super(key: key);
  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  Future<Class> classroom;
  @override
  Widget build(BuildContext context) {
    FireStoreUtils.currentUserDocRef.snapshots().listen((event) {
      setState(() {
        classCode = MyAppState.currentUser.classCode;
        classroom = getClass();
      });
    });
    return Container(
      child: FutureBuilder<Class>(
          future: classroom,
          builder: (BuildContext context, AsyncSnapshot<Class> snapshot) {
            List<Widget> children;
            if (snapshot.hasData) {
              children = <Widget>[
                ChapterList(classroom: snapshot.data),
              ];
            } else if (!snapshot.hasData) {
              children = <Widget>[
                NoClassPage(),
              ];
            } else if (snapshot.hasError) {
              children = <Widget>[
                Icon(
                  Icons.error_outline,
                  color: Colors.red,
                  size: 60,
                ),
              ];
            } else {
              children = <Widget>[
                SizedBox(
                  child: CircularProgressIndicator(),
                  width: 50,
                  height: 50,
                ),
              ];
            }
            return Stack(
              children: children,
            );
          }),
    );
  }

  Future<Class> getClass() async {
    Class classroom;
    return classroom = await _fireStoreUtils.getClass(classCode);
  }
}
