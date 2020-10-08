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
        backgroundColor: Color(Constants.COLOR_ACCENT),
      ),
      body: new Container(
        child: new ListView(
          children: <Widget>[
            Card(
              child: ListTile(
                title: Text('Chapter 1'),
                subtitle: Text('Introduction and Fraction in Real Life'),
                leading: Icon(
                  Icons.collections_bookmark,
                  color: Colors.red,
                ),
                trailing: IconButton(
                  icon: Icon(
                    Icons.arrow_forward,
                    color: Color(Constants.COLOR_WORDING),
                  ),
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
            ),
            Card(
              child: ListTile(
                title: Text('Chapter 2'),
                subtitle: Text('Basic of Fraction'),
                leading: Icon(
                  Icons.menu,
                  color: Colors.orange,
                ),
                trailing: IconButton(
                  icon: Icon(
                    Icons.arrow_forward,
                    color: Color(Constants.COLOR_WORDING),
                  ),
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
            ),
            Card(
              child: ListTile(
                title: Text('Chapter 3'),
                subtitle: Text('Conversion of Fraction'),
                leading: Icon(
                  Icons.import_contacts,
                  color: Colors.yellow,
                ),
                trailing: IconButton(
                  icon: Icon(
                    Icons.arrow_forward,
                    color: Color(Constants.COLOR_WORDING),
                  ),
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
            ),
            Card(
              child: ListTile(
                title: Text('Chapter 4'),
                subtitle: Text('Conversion of Fraction'),
                leading: Icon(
                  Icons.import_contacts,
                  color: Colors.green,
                ),
                trailing: IconButton(
                  icon: Icon(
                    Icons.arrow_forward,
                    color: Color(Constants.COLOR_WORDING),
                  ),
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
            ),
            Card(
              child: ListTile(
                title: Text('Chapter 5'),
                subtitle: Text('Conversion of Fraction'),
                leading: Icon(
                  Icons.import_contacts,
                  color: Colors.blue,
                ),
                trailing: IconButton(
                  icon: Icon(
                    Icons.arrow_forward,
                    color: Color(Constants.COLOR_WORDING),
                  ),
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
            ),
            Card(
              child: ListTile(
                title: Text('Chapter 5'),
                subtitle: Text('Conversion of Fraction'),
                leading: Icon(
                  Icons.import_contacts,
                  color: Colors.indigo,
                ),
                trailing: IconButton(
                  icon: Icon(
                    Icons.arrow_forward,
                    color: Color(Constants.COLOR_WORDING),
                  ),
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
            ),
            Card(
              child: ListTile(
                title: Text('Chapter 5'),
                subtitle: Text('Conversion of Fraction'),
                leading: Icon(
                  Icons.import_contacts,
                  color: Colors.purple,
                ),
                trailing: IconButton(
                  icon: Icon(
                    Icons.arrow_forward,
                    color: Color(Constants.COLOR_WORDING),
                  ),
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
            ),
          ],
        ),
      ),
    );
  }
}
