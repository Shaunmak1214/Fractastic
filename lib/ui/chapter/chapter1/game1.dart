import 'package:flutter/material.dart';
import 'package:simple_url_preview/simple_url_preview.dart';
import 'package:url_launcher/url_launcher.dart';

class Chap1game1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: new Text('Welcome to Game Page'),
          centerTitle: true,
          backgroundColor: Colors.blue,
          leading: new IconButton(
            icon: new Icon(Icons.arrow_back),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        body: new Column(
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: SizedBox(height: 60.0),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: SimpleUrlPreview(
                url:
                    'https://www.mathplayground.com/fraction_forest_part1.html',
                textColor: Colors.white,
                bgColor: Colors.indigo[300],
                isClosable: false,
                titleLines: 2,
                descriptionLines: 3,
                imageLoaderColor: Colors.white,
                previewHeight: 250,
                previewContainerPadding: EdgeInsets.all(8.0),
                onTap: () => print('This is Fraction game description'),
              ),
            ),
            SizedBox(
              height: 50.0,
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Center(
                child: RaisedButton.icon(
                  icon: Icon(Icons.link),
                  color: Colors.blue[300],
                  highlightColor: Colors.blue[300],
                  textColor: Colors.black,
                  onPressed: _launchURL,
                  label: new Text('Play Game !'),
                ),
              ),
            ),
          ],
        ));
  }
}

_launchURL() async {
  {
    const url = 'https://www.mathplayground.com/fraction_forest_part1.html';
    if (await canLaunch(url)) {
      print('loading url');
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
