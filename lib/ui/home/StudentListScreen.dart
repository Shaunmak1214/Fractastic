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
  final _formKey = GlobalKey<FormState>();
  _StudentListScreenState();

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Class>>.value(
      value: FireStoreUtils().classes,
      child: Scaffold(
        body: StudentList(),
      ),
    );
  }
}
