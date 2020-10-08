import 'package:flutter/material.dart';
import 'package:fractastic/model/Class.dart';
import '../../constants.dart' as Constants;

class ClassTile extends StatelessWidget {
  final Class classTile;
  ClassTile({this.classTile});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
        child: ListTile(
          leading: Icon(Icons.business, color: Colors.black),
          title: Text(classTile.name,
              style: TextStyle(color: Color(Constants.COLOR_PRIMARY_DARK))),
          trailing: Icon(Icons.arrow_forward_ios,
              color: Color(Constants.COLOR_PRIMARY_DARK)),
        ),
      ),
    );
  }
}
