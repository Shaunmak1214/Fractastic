import 'package:flutter/material.dart';
import 'package:fractastic/ui/home/Chapter1OptionPage.dart';
import 'package:fractastic/ui/home/Chapter2OptionPage.dart';
import 'package:fractastic/ui/home/Chapter3OptionPage.dart';
import '../../constants.dart' as Constants;

class ChapterList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: new Text('Choose Chapter'),
          centerTitle: true,
          backgroundColor: Color(Constants.COLOR_PRIMARY),
          leading: new IconButton(
            icon: new Icon(Icons.arrow_back),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        body: Container(
          child: Column(
            children: <Widget>[
              new Padding(
                padding: const EdgeInsets.all(8.0),
              ),
              new ListTile(
                leading: Icon(Icons.star),
                trailing: Icon(Icons.done),
                title: Text("Chapter 1"),
                subtitle: Text("Introduction of Fraction in Real Life"),
                dense: true, //can be false dk which better
                onTap: () => Navigator.push(
                  context,
                  new MaterialPageRoute(builder: (_) => Chapter1OptionPage()),
                ),
                selected: true,
              ),
              new ListTile(
                leading: Icon(Icons.star),
                trailing: Icon(Icons.done_all),
                title: Text("Chapter 2"),
                subtitle: Text("Basic of Fraction"),
                dense: true,
                onTap: () => Navigator.push(
                  context,
                  new MaterialPageRoute(builder: (_) => Chapter2OptionPage()),
                ),
                selected: true,
              ),
              new ListTile(
                leading: Icon(Icons.star),
                trailing: Icon(Icons.keyboard_arrow_right),
                title: Text("Chapter 3"),
                subtitle: Text("Conversion of Fraction"),
                dense: true,
                onTap: () => Navigator.push(
                  context,
                  new MaterialPageRoute(builder: (_) => Chapter3OptionPage()),
                ),
                selected: true,
              ),
            ],
          ),
        ));
  }
}
