import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fractastic/model/Class.dart';
import 'package:fractastic/ui/home/ClassTile.dart';

class ClassList extends StatefulWidget {
  static List<String> classCodes = new List<String>();
  @override
  _ClassListState createState() => _ClassListState(classCodes);
}

class _ClassListState extends State<ClassList> {
  static List<String> classCodes;
  _ClassListState(classCodes);
  @override
  Widget build(BuildContext context) {
    final classes = Provider.of<List<Class>>(context);
    classes.forEach((element) {
      if (!classCodes.contains(element.classCode))
        classCodes.add(element.classCode);
    });

    return ListView.builder(
      itemCount: classes.length,
      itemBuilder: (context, index) {
        return ClassTile(classTile: classes[index]);
      },
    );
  }
}
