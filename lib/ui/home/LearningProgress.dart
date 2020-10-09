import 'package:flutter/material.dart';
import 'package:fractastic/model/User.dart';
import 'package:percent_indicator/percent_indicator.dart';

class LearningProgress extends StatelessWidget {
  LearningProgress({this.user});
  final User user;
  @override
  Widget build(BuildContext context) {
    int _quizCount = user.quizCount;
    double percentage = _quizCount / 7.0 * 100.0;
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Circular Percent Indicators"),
      ),
      body: Center(
        child: ListView(children: <Widget>[
          new CircularPercentIndicator(
            radius: 120.0,
            lineWidth: 13.0,
            animation: true,
            percent: _quizCount / 7,
            center: new Text(
              "$percentage%",
              style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
            ),
            footer: new Text(
              "Learning Progress",
              style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 17.0),
            ),
            circularStrokeCap: CircularStrokeCap.round,
            progressColor: Colors.purple,
          ),
        ]),
      ),
    );
  }
}
