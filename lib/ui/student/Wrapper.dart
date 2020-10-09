import 'package:flutter/material.dart';
import 'package:fractastic/ui/home/ChapterListScreen.dart';
import 'package:fractastic/model/Class.dart';
import 'package:fractastic/ui/services/Authenticate.dart';
import 'package:fractastic/ui/student/NoClassPage.dart';
import '../../main.dart';

FireStoreUtils _fireStoreUtils = FireStoreUtils();
String classCode;

class Wrapper extends StatefulWidget {
  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  @override
  Widget build(BuildContext context) {
    setState(() {
      classCode = MyAppState.currentUser.classCode;
    });

    // if (classCode == null || classCode == '')
    //   return NoClassPage();
    // else {
    //   FutureBuilder(
    //     future: getClass(),
    //     builder: (context, snapshot) {
    //       return ChapterList(classroom: snapshot.data);
    //     },
    //   );
    // }
    // return Center(child: CircularProgressIndicator());
    return Container(
      child: FutureBuilder<Class>(
        future: getClass(),
        builder: (BuildContext context, AsyncSnapshot<Class> snapshot) {
          List<Widget> children;
          if (snapshot.hasData) {
            children = <Widget>[
              ChapterList(classroom: snapshot.data),
            ];
          } else if (snapshot.hasData) {
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
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Text('Error: ${snapshot.error}'),
              )
            ];
          } else {
            children = <Widget>[
              SizedBox(
                child: CircularProgressIndicator(),
                width: 60,
                height: 60,
              ),
              const Padding(
                padding: EdgeInsets.only(top: 16),
                child: Text('Awaiting result...'),
              )
            ];
          }
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: children,
            ),
          );
        },
      ),
    );
  }

  Future<Class> getClass() async {
    Class classroom;
    return classroom = await _fireStoreUtils.getClass(classCode);
  }
}
