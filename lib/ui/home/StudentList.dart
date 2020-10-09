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

class StudentList extends StatefulWidget {
  @override
  _StudentListState createState() => _StudentListState();
}

class _StudentListState extends State<StudentList> {
  User user = MyAppState.currentUser;
  List<User> studentList = new List<User>();
  List<User> filteredStudentList = new List<User>();
  List<DropdownMenuItem<Class>> _dropdownMenuClass;
  Class _selectedClass;

  @override
  Widget build(BuildContext context) {
    List<Class> classes = [];
    var prov = Provider.of<List<Class>>(context);
    if (prov != null) {
      prov.forEach((classroom) {
        if (classroom.teacherId == user.userID &&
            !classes.contains(classroom)) {
          classes.add(classroom);
        }
      });
    }
    if (prov == null || classes.isEmpty) {
      return Center(
        child: SizedBox(
          child: CircularProgressIndicator(),
          width: 50,
          height: 50,
        ),
      );
    }

    FireStoreUtils.userCollection.snapshots().listen((snapshot) {
      setState(() {
        studentList = snapshot.documents.map((doc) {
          return User.fromJson(doc.data);
        }).toList();
      });
    });

    return Container(
      padding: EdgeInsets.all(20.0),
      child: DropdownButton<Class>(
        items: classes.isNotEmpty
            ? classes.map<DropdownMenuItem<Class>>((Class classroom) {
                return DropdownMenuItem<Class>(
                  value: classroom,
                  child: Text(classroom.name),
                );
              }).toList()
            : [],
        onChanged: (Class newClassSelected) {
          setState(() {
            _selectedClass = newClassSelected;
            filteredStudentList.clear();
            createFilteredStudentList();
            print('select new class');
            if (studentList != null && studentList.isNotEmpty) {
              filterStudentList();
              print('print student in listview');
              return ListView.builder(
                itemCount: filteredStudentList.length,
                itemBuilder: (context, index) {
                  return StudentTile(studentTile: filteredStudentList[index]);
                },
              );
            } else if (studentList == null) {
              return Center(
                child: SizedBox(
                  child: CircularProgressIndicator(),
                  width: 50,
                  height: 50,
                ),
              );
            } else {
              print('aoisdoaisdjioasd');
              return Container();
            }
          });
        },
        value: _selectedClass,
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
          !filteredStudentList.contains(element)) {
        filteredStudentList.add(element);
      }
    });
  }
}
