import 'package:flutter/material.dart';
//import 'package:simple_url_preview/simple_url_preview.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../constants.dart' as Constants;

class Chap1game1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: new Text('Welcome to Game Page'),
          centerTitle: true,
          backgroundColor: Color(Constants.COLOR_PRIMARY),
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
                child: new Image(
                  image: AssetImage('assets/images/game.png'),
                )
                // SimpleUrlPreview(
                //   url:
                //       'https://www.mathplayground.com/fraction_forest_part1.html',
                //   textColor: Colors.white,
                //   bgColor: Colors.indigo[300],
                //   isClosable: false,
                //   titleLines: 2,
                //   descriptionLines: 3,
                //   imageLoaderColor: Colors.white,
                //   previewHeight: 250,
                //   previewContainerPadding: EdgeInsets.all(8.0),
                //   onTap: () => print('This is Fraction game description'),
                // ),
                ),
            SizedBox(
              height: 50.0,
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Center(
                  child: Container(
                width: 200.0,
                height: 50.0,
                child: RaisedButton.icon(
                  icon: Icon(
                    Icons.link,
                    size: 33,
                  ),
                  color: Color(Constants.COLOR_ACCENT),
                  textColor: Colors.white,
                  onPressed: _launchURL,
                  label: new Text(
                    'Play Game !',
                    style: TextStyle(fontSize: 22.0),
                  ),
                ),
              )),
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
