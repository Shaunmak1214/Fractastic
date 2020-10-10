import 'package:flutter/material.dart';
import 'package:fractastic/ui/home/DropDownMenu.dart';
import 'package:provider/provider.dart';
import '../../main.dart';
import '../../model/Class.dart';
import '../../model/User.dart';

class StudentList extends StatefulWidget {
  @override
  _StudentListState createState() => _StudentListState();
}

class _StudentListState extends State<StudentList> {
  User user = MyAppState.currentUser;

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

    return DropDownMenu(classes: classes);
  }
}
