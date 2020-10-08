import 'package:flutter/material.dart';
import 'package:fractastic/ui/home/Chapter1OptionPage.dart';
import 'package:fractastic/ui/home/Chapter2OptionPage.dart';
import 'package:fractastic/ui/home/Chapter3OptionPage.dart';
import '../../constants.dart' as Constants;

class ChapterList extends StatefulWidget {
  @override
  _MyChapterListState createState() => _MyChapterListState();
}

class _MyChapterListState extends State<ChapterList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Choose Chapter',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Color(Constants.COLOR_PRIMARY),
      ),
      body: new Container(
        child: new ListView(
          children: <Widget>[
            ListTile(
              title: Text('Chapter 1'),
              subtitle: Text('Introduction and Fraction in Real Life'),
              trailing: IconButton(
                icon: Icon(Icons.arrow_forward),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Chapter1OptionPage(),
                    ),
                  );
                },
              ),
            ),
            ListTile(
              title: Text('Chapter 2'),
              subtitle: Text('Basic of Fraction'),
              trailing: IconButton(
                icon: Icon(Icons.arrow_forward),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Chapter2OptionPage(),
                    ),
                  );
                },
              ),
            ),
            ListTile(
              title: Text('Chapter 3'),
              subtitle: Text('Conversion of Fraction'),
              trailing: IconButton(
                icon: Icon(Icons.arrow_forward),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Chapter3OptionPage(),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
