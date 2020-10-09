import 'package:flutter/material.dart';
import 'package:fractastic/model/Class.dart';
import 'package:fractastic/ui/home/ChapterListScreen.dart';
import '../../constants.dart' as Constants;

class ClassTile extends StatelessWidget {
  final Class classTile;
  ClassTile({this.classTile});
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        contentPadding: EdgeInsets.fromLTRB(16.0, 5.0, 16.0, 5.0),
        leading: Icon(Icons.location_city, color: Colors.black),
        title: Text(classTile.name),
        subtitle: Text('Class Code: ' + classTile.classCode),
        trailing: Icon(Icons.arrow_forward_ios,
            color: Color(Constants.COLOR_PRIMARY)),
        onTap: () {
          Navigator.push(
              context,
              new MaterialPageRoute(
                  builder: (_) => ChapterList(classroom: classTile)));
        },
      ),
    );
  }
}
