import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constants.dart';
import '../../main.dart';
import '../../model/Class.dart';
import '../../model/Class.dart';
import '../../model/User.dart';
import '../services/Authenticate.dart';

class StudentList extends StatefulWidget {
  @override
  _StudentListState createState() => _StudentListState();
}

class _StudentListState extends State<StudentList> {
  User user = MyAppState.currentUser;
  List<DropdownMenuItem<Class>> _dropdownMenuClass;
  Class _selectedClass;

  @override
  Widget build(BuildContext context) {
    List<Class> classes = new List<Class>();
    var prov = Provider.of<List<Class>>(context);
    if (prov != null) {
      //classes = prov;
      prov.forEach((classroom) {
        if (classroom.teacherId == user.userID) {
          classes.add(classroom);
        }
      });
    }
    if (prov == null) {
      return Center(
        child: SizedBox(
          child: CircularProgressIndicator(),
          width: 50,
          height: 50,
        ),
      );
    }
    if (classes.isNotEmpty) {
      classes.forEach((element) {
        if (!MyAppState.classCodeList.contains(element.classCode))
          MyAppState.classCodeList.add(element.classCode);
      });
    }

    return Container(
      padding: EdgeInsets.all(20.0),
      child: DropdownButton<Class>(
        items: classes.map<DropdownMenuItem<Class>>((Class classroom) {
          search(classroom);
          return DropdownMenuItem<Class>(
            value: classroom,
            child: Text(classroom.name),
          );
        }).toList(),
        onChanged: (Class newClassSelected) {
          setState(() {
            this._selectedClass = newClassSelected;
          });
        },
        value: _selectedClass,
      ),
    );
  }

  void search(Class classroom) {


    FireStoreUtils.userCollection.snapshots()
        classroom.classCode = this._selectedClass.classCode;
      );
    });
  }
}
