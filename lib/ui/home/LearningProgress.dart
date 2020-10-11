import 'package:flutter/material.dart';
import 'package:fractastic/model/User.dart';
import 'package:percent_indicator/percent_indicator.dart';
import '../../constants.dart' as Constants;

// void main() =>
//     runApp(new MaterialApp(home: LearningProgress(user: User(quizCount: 2))));

class LearningProgress extends StatelessWidget {
  LearningProgress({this.user});
  final User user;
  @override
  Widget build(BuildContext context) {
    int _quizCount = user.quizCount ?? 0;
    double percentage = _quizCount / 7.0 * 100.0;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Learning Progress',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color(Constants.COLOR_PRIMARY),
        centerTitle: true,
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Center(
        child: ListView(children: <Widget>[
          SizedBox(height: 60.0),
          new CircularPercentIndicator(
            radius: 200.0,
            lineWidth: 23.0,
            animation: true,
            percent: _quizCount / 7,
            center: new Text(
              format(percentage) + "%",
              style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
            ),
            footer: new Text(
              "$_quizCount out of 7 quiz completed",
              style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 17.0),
            ),
            circularStrokeCap: CircularStrokeCap.round,
            progressColor: Colors.green[400],
          ),
          SizedBox(height: 50.0),
          Image.asset(
            'assets/images/LearningProg.png',
            height: 200,
            fit: BoxFit.fitHeight,
          ),
        ]),
      ),
    );
  }

  String format(double n) {
    return n.toStringAsFixed(n.truncateToDouble() == n ? 0 : 2);
  }
}
