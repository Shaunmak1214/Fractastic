import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constants.dart';
import '../../main.dart';
import '../../model/Class.dart';

class StudentList extends StatefulWidget {
  @override
  _StudentListState createState() => _StudentListState();
}

class _StudentListState extends State<StudentList> {
  List<DropdownMenuItem<Class>> _dropdownMenuClass;
  Class _selectedClass;

  void initState() {
    super.initState();
    _dropdownMenuClass = buildDropDownMenuItems();
    _selectedClass = _dropdownMenuClass[0].value;
  }

  List<DropdownMenuItem<Class>> buildDropDownMenuItems(List listClasses) {
    List<DropdownMenuItem<Class>> items = List();
    for (Class listClass in listClasses) {
      items.add(
        DropdownMenuItem(
          child: Text(listClass.name),
          value: listClass,
        ),
      );
    }
    return items;
  }

  @override
  Widget build(BuildContext context) {
    List<Class> classes = new List<Class>();
    var prov = Provider.of<List<Class>>(context);
    if (prov != null) {
      classes = prov;
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
            items: classes.map((Class class){
              return DropdownMenuItem<Class>(
                value : class,
                child : Text(class),
              );
            }).toList(),
   onChanged: (Class newClassSelected) {
              setState(() {
                this._selectedClass = newClassSelected;
              });
            },
            value : _selectedClass,
            ),
         );
  }
}

class ( {
}
