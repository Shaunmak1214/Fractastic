import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fractastic/ui/student/Wrapper.dart';
import 'package:provider/provider.dart';

import '../../constants.dart';
import '../../main.dart';
import '../../model/Class.dart';
import '../../model/User.dart';
import '../services/Authenticate.dart';
import 'StudentTile.dart';

class DropDownMenu extends StatefulWidget {
  final List<Class> classes;
  DropDownMenu({Key key, @required this.classes}) : super(key: key);
  @override
  _DropDownMenuState createState() => _DropDownMenuState(classes);
}

class _DropDownMenuState extends State<DropDownMenu> {
  final List<Class> classes;
  _DropDownMenuState(this.classes);

  User user = MyAppState.currentUser;
  List<User> studentList = new List<User>();
  List<User> filteredStudentList = new List<User>();
  Class _selectedClass;

  @override
  void initState() {
    _selectedClass = classes[0];
  }

  @override
  Widget build(BuildContext context) {
    // FireStoreUtils.userCollection.snapshots().listen((snapshot) {
    //   setState(() {
    //     //print(MyAppState.classCodeList);
    //     studentList = snapshot.documents.map((doc) {
    //       return User.fromJson(doc.data);
    //     }).toList();
    //   });
    // });
    //_selectedClass = _selectedClass ?? classes[0];
    FireStoreUtils.userCollection.snapshots().listen((snapshot) {
      studentList = snapshot.documents.map((doc) {
        return User.fromJson(doc.data);
      }).toList();
    });

    if (studentList == null) {
      return Center(
        child: SizedBox(
          child: CircularProgressIndicator(),
          width: 50,
          height: 50,
        ),
      );
    }

    return Scaffold(
      body: Column(
        children: [
          DropdownButton<Class>(
            items: classes.isNotEmpty
                ? classes.map<DropdownMenuItem<Class>>((Class classroom) {
                    return DropdownMenuItem<Class>(
                      value: classroom,
                      child: Text(classroom.name),
                    );
                  }).toList()
                : [],
            value: _selectedClass,
            onChanged: (Class newClassSelected) {
              setState(() {
                _selectedClass = newClassSelected;
                if (studentList != null && studentList.isNotEmpty) {
                  filteredStudentList.clear();
                  filterStudentList();
                }
              });
            },
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredStudentList.length,
              itemBuilder: (context, index) {
                return StudentTile(studentTile: filteredStudentList[index]);
              },
            ),
          ),
        ],
      ),
    );
  }

  createFilteredStudentList() {
    FireStoreUtils.userCollection.snapshots().listen((snapshot) {
      studentList = snapshot.documents.map((doc) {
        return User.fromJson(doc.data);
      }).toList();
    });
  }

  filterStudentList() {
    studentList.forEach((element) {
      if (element.classCode == _selectedClass.classCode &&
          !filteredStudentList.contains(element) &&
          element.userType == 'Student') {
        filteredStudentList.add(element);
      }
    });
  }
}
