import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fractastic/model/Class.dart';
import 'package:fractastic/ui/home/ClassTile.dart';
import 'package:fractastic/model/User.dart';
import '../../main.dart';

class ClassList extends StatefulWidget {
  @override
  _ClassListState createState() => _ClassListState();
}

class _ClassListState extends State<ClassList> {
  User user = MyAppState.currentUser;
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
    return Scaffold(
      appBar: CustomAppBar(
        height: 100,
      ),
      body: ListView.builder(
        itemCount: classes.length,
        itemBuilder: (context, index) {
          return ClassTile(classTile: classes[index]);
        },
      ),
    );
  }
}

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double height;

  const CustomAppBar({
    Key key,
    @required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
          Center(
            child: Container(
              margin: EdgeInsets.fromLTRB(0.0, 25.0, 0.0, 10.0),
              padding: EdgeInsets.fromLTRB(15.0, 8.0, 15.0, 8.0),
              decoration: BoxDecoration(
                border: Border.all(width: 2, color: Colors.redAccent),
                borderRadius: BorderRadius.circular(25.0),
                color: Colors.redAccent,
              ),
              child: Text(
                'Classroom',
                style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
          ),
        ])));
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
