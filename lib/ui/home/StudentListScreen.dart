import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fractastic/model/User.dart';
import 'package:fractastic/ui/home/StudentList.dart';
import 'package:fractastic/ui/services/Authenticate.dart';
import 'package:fractastic/ui/utils/helper.dart';
import 'package:provider/provider.dart';
import 'package:fractastic/ui/home/ClassList.dart';
import 'package:fractastic/model/Class.dart';
import 'package:uuid/uuid.dart';
import '../../main.dart';
import '../../constants.dart' as Constants;

class StudentListScreen extends StatefulWidget {
  StudentListScreen({Key key}) : super(key: key);

  @override
  _StudentListScreenState createState() => _StudentListScreenState();
}

class _StudentListScreenState extends State<StudentListScreen> {
  _StudentListScreenState();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        height: 100,
      ),
      body: StreamProvider<List<Class>>.value(
        value: FireStoreUtils().classes,
        child: Scaffold(
          body: StudentList(),
        ),
      ),
    );
  }
}

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double height;

  const CustomAppBar({
    Key key,
    @required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
          Center(
            child: Container(
              margin: EdgeInsets.fromLTRB(0.0, 25.0, 0.0, 10.0),
              padding: EdgeInsets.fromLTRB(15.0, 8.0, 15.0, 8.0),
              decoration: BoxDecoration(
                border: Border.all(width: 2, color: Colors.green[300]),
                borderRadius: BorderRadius.circular(25.0),
                color: Colors.green[300],
              ),
              child: Text(
                'Student List',
                style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
          ),
        ])));
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
