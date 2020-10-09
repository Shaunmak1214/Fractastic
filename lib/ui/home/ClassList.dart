import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fractastic/model/Class.dart';
import 'package:fractastic/ui/home/ClassTile.dart';
import '../../main.dart';

class ClassList extends StatefulWidget {
  @override
  _ClassListState createState() => _ClassListState();
}

class _ClassListState extends State<ClassList> {
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
    if (prov == null) {
      return Center(
        child: SizedBox(
          child: CircularProgressIndicator(),
          width: 50,
          height: 50,
        ),
      );
    }
    return ListView.builder(
      itemCount: classes.length,
      itemBuilder: (context, index) {
        return ClassTile(classTile: classes[index]);
      },
    );
  }
}
