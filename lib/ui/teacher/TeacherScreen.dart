import 'package:flutter/material.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import '../../constants.dart' as Constants;

void main() => runApp(TeacherApp());

class TeacherApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyPackage(),
    );
  }
}

class MyPackage extends StatefulWidget {
  @override
  _MyPackageState createState() => _MyPackageState();
}

class _MyPackageState extends State<MyPackage> {
  int currentIndex = 0;
  List listOfScreen = [
    Container(
      color: Colors.orange,
      //chaptersoption
    ),
    Container(
      color: Colors.pink,
      //quiz result
    ),
    Container(
      color: Colors.red,
      //calendar
    ),
    Container(
      color: Colors.purple,
      //calendar
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Classroom',
          style: TextStyle(color: Colors.black),
        ),
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Color(Constants.COLOR_PRIMARY),
        centerTitle: true,
      ),
      body: listOfScreen[currentIndex],
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: currentIndex,
        onItemSelected: (index) {
          setState(
            () {
              currentIndex = index;
            },
          );
        },
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
            icon: Icon(Icons.child_care),
            title: Text('Students'),
            activeColor: Color(Constants.COLOR_ACCENT),
            inactiveColor: Colors.black,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.book),
            title: Text('Chapters'),
            activeColor: Color(Constants.COLOR_ACCENT),
            inactiveColor: Colors.black,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.toc),
            title: Text('Results'),
            activeColor: Color(Constants.COLOR_ACCENT),
            inactiveColor: Colors.black,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.calendar_today),
            title: Text('Calendar'),
            activeColor: Color(Constants.COLOR_ACCENT),
            inactiveColor: Colors.black,
          )
        ],
      ),
    );
  }
}

/*
class StudentApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Classroom"),
          textTheme: Theme.of(context).textTheme.apply(
                bodyColor: Colors.black,
                displayColor: Colors.black,
              ),
          centerTitle: true,
          backgroundColor: Colors.white,
        ),
        body: Padding(
            padding: EdgeInsets.only(left: 20, top: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  height: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.blue[400],
                  ),
                ),
                SizedBox(height: 30),
              ],
            )),
      ),
    );
  }
}

*/
