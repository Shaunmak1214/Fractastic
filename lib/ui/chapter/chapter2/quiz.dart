import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:fractastic/ui/services/Authenticate.dart';
import 'package:fractastic/model/User.dart';
import 'package:fractastic/main.dart';
import 'package:fractastic/ui/utils/helper.dart';
import '../../../constants.dart' as Constants;

var result2;
FireStoreUtils _fireStoreUtils = FireStoreUtils();

class Chap2Quiz extends StatefulWidget {
  @override
  _Chap2QuizState createState() => _Chap2QuizState();
}

class _Chap2QuizState extends State<Chap2Quiz> {
  User user = MyAppState.currentUser;
  int status = 0;
  int _radioValue1 = -1;
  int correctScore = 0;
  int _radioValue2 = -1;
  int _radioValue3 = -1;
  int _radioValue4 = -1;
  int _radioValue5 = -1;
  List<int> ansResult = [0, 0, 0, 0, 0];

  void _handleRadioValueChange1(int value) {
    setState(() {
      _radioValue1 = value;

      switch (_radioValue1) {
        case 0:
          Fluttertoast.showToast(
              msg: 'You are AWESOME !', toastLength: Toast.LENGTH_SHORT);
          ansResult[0] = 1;
          break;
        case 1:
          Fluttertoast.showToast(
              msg: 'Try again !', toastLength: Toast.LENGTH_SHORT);
          ansResult[0] = 0;
          break;
        case 2:
          Fluttertoast.showToast(
              msg: 'Try again !', toastLength: Toast.LENGTH_SHORT);
          ansResult[0] = 0;
          break;
      }
    });
  }

  void _handleRadioValueChange2(int value) {
    setState(() {
      _radioValue2 = value;

      switch (_radioValue2) {
        case 0:
          Fluttertoast.showToast(
              msg: 'Try again !', toastLength: Toast.LENGTH_SHORT);
          ansResult[1] = 0;
          break;
        case 1:
          Fluttertoast.showToast(
              msg: 'You are AWESOME !', toastLength: Toast.LENGTH_SHORT);
          ansResult[1] = 1;
          break;
        case 2:
          Fluttertoast.showToast(
              msg: 'Try again !', toastLength: Toast.LENGTH_SHORT);
          ansResult[1] = 0;
          break;
      }
    });
  }

  void _handleRadioValueChange3(int value) {
    setState(() {
      _radioValue3 = value;

      switch (_radioValue3) {
        case 0:
          Fluttertoast.showToast(
              msg: 'Try again !', toastLength: Toast.LENGTH_SHORT);
          ansResult[2] = 0;
          break;
        case 1:
          Fluttertoast.showToast(
              msg: 'You are such a genius !', toastLength: Toast.LENGTH_SHORT);
          ansResult[2] = 1;
          break;
        case 2:
          Fluttertoast.showToast(
              msg: 'Try again !', toastLength: Toast.LENGTH_SHORT);
          ansResult[2] = 0;
          break;
      }
    });
  }

  void _handleRadioValueChange4(int value) {
    setState(() {
      _radioValue4 = value;

      switch (_radioValue4) {
        case 0:
          Fluttertoast.showToast(
              msg: 'Perfect !', toastLength: Toast.LENGTH_SHORT);
          ansResult[3] = 1;
          break;
        case 1:
          Fluttertoast.showToast(
              msg: 'Try again !', toastLength: Toast.LENGTH_SHORT);
          ansResult[3] = 0;
          break;
        case 2:
          Fluttertoast.showToast(
              msg: 'Try again !', toastLength: Toast.LENGTH_SHORT);
          ansResult[3] = 0;
          break;
      }
    });
  }

  void _handleRadioValueChange5(int value) {
    setState(() {
      _radioValue5 = value;

      switch (_radioValue5) {
        case 0:
          Fluttertoast.showToast(
              msg: 'Try again !', toastLength: Toast.LENGTH_SHORT);
          ansResult[4] = 0;
          break;
        case 1:
          Fluttertoast.showToast(
              msg: 'Try again !', toastLength: Toast.LENGTH_SHORT);
          ansResult[4] = 0;
          break;
        case 2:
          Fluttertoast.showToast(
              msg: 'Congratulations !', toastLength: Toast.LENGTH_SHORT);
          ansResult[4] = 1;
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: new Scaffold(
            appBar: AppBar(
              title: new Text('Chapter 2 Quiz'),
              centerTitle: true,
              backgroundColor: Color(Constants.COLOR_PRIMARY),
              leading: new IconButton(
                icon: new Icon(Icons.arrow_back),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ),
            body: new Container(
                padding: EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  child: new Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Container(
                          padding:
                              new EdgeInsets.fromLTRB(10.0, 16.0, 6.0, 8.0),
                          color: Colors.red[100],
                          child: new Text(
                            'Select correct answers based on the picture given:',
                            style: new TextStyle(
                                fontSize: 20.0, fontWeight: FontWeight.bold),
                          ),
                        ),
                        new Padding(
                          padding: new EdgeInsets.all(8.0),
                        ),
                        new Divider(height: 5.0, color: Colors.black),
                        new Padding(
                          padding: new EdgeInsets.all(8.0),
                        ),
                        new Image(
                            image: AssetImage('assets/images/denominator.png')),
                        Container(
                          padding:
                              new EdgeInsets.fromLTRB(20.0, 16.0, 6.0, 8.0),
                          color: Colors.amber[100],
                          child: new Text(
                            '1.   Which number is the denominator of this fraction ',
                            style: new TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 18.0,
                            ),
                          ),
                        ),
                        Container(
                          color: Colors.amber[100],
                          child: new Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              new Radio(
                                value: 0,
                                groupValue: _radioValue1,
                                onChanged: _handleRadioValueChange1,
                              ),
                              GestureDetector(
                                onTap: () {
                                  _handleRadioValueChange1(0);
                                },
                                child: Text("A.   5"),
                              ),
                              new Radio(
                                value: 1,
                                groupValue: _radioValue1,
                                onChanged: _handleRadioValueChange1,
                              ),
                              GestureDetector(
                                onTap: () {
                                  _handleRadioValueChange1(1);
                                },
                                child: Text("B.   2"),
                              ),
                              new Radio(
                                value: 2,
                                groupValue: _radioValue1,
                                onChanged: _handleRadioValueChange1,
                              ),
                              GestureDetector(
                                onTap: () {
                                  _handleRadioValueChange1(2);
                                },
                                child: Text("C.   4"),
                              ),
                            ],
                          ),
                        ),
                        new Divider(
                          height: 5.0,
                          color: Colors.black,
                        ),
                        new Padding(
                          padding: new EdgeInsets.all(8.0),
                        ),
                        new Image(
                            image: AssetImage(
                                'assets/images/improperFraction.png')),
                        Container(
                          padding: new EdgeInsets.fromLTRB(8.0, 16.0, 6.0, 8.0),
                          color: Colors.yellow,
                          child: new Text(
                            '2.   What type of this fraction is? ',
                            style: new TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 18.0,
                            ),
                          ),
                        ),
                        Container(
                          color: Colors.yellow,
                          child: new Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              new Radio(
                                value: 0,
                                groupValue: _radioValue2,
                                onChanged: _handleRadioValueChange2,
                              ),
                              GestureDetector(
                                onTap: () {
                                  _handleRadioValueChange2(0);
                                },
                                child: Text("A.   Proper"),
                              ),
                              new Radio(
                                value: 1,
                                groupValue: _radioValue2,
                                onChanged: _handleRadioValueChange2,
                              ),
                              GestureDetector(
                                onTap: () {
                                  _handleRadioValueChange2(1);
                                },
                                child: Text("B.   Improper"),
                              ),
                              new Radio(
                                value: 2,
                                groupValue: _radioValue2,
                                onChanged: _handleRadioValueChange2,
                              ),
                              GestureDetector(
                                onTap: () {
                                  _handleRadioValueChange2(2);
                                },
                                child: Text("C.   Mixed"),
                              ),
                            ],
                          ),
                        ),
                        new Divider(
                          height: 5.0,
                          color: Colors.black,
                        ),
                        new Padding(
                          padding: new EdgeInsets.all(8.0),
                        ),
                        new Image(
                            image:
                                AssetImage('assets/images/likeFraction.png')),
                        Container(
                          padding:
                              new EdgeInsets.fromLTRB(20.0, 16.0, 6.0, 8.0),
                          color: Colors.green[200],
                          child: new Text(
                            '3.   How do we name the fraction with common denominator?',
                            style: new TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 18.0,
                            ),
                          ),
                        ),
                        Container(
                          color: Colors.green[200],
                          child: new Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              new Radio(
                                value: 0,
                                groupValue: _radioValue3,
                                onChanged: _handleRadioValueChange3,
                              ),
                              GestureDetector(
                                onTap: () {
                                  _handleRadioValueChange3(0);
                                },
                                child: Text("A.   Improper"),
                              ),
                              new Radio(
                                value: 1,
                                groupValue: _radioValue3,
                                onChanged: _handleRadioValueChange3,
                              ),
                              GestureDetector(
                                onTap: () {
                                  _handleRadioValueChange3(1);
                                },
                                child: Text("B.   Like"),
                              ),
                              new Radio(
                                value: 2,
                                groupValue: _radioValue3,
                                onChanged: _handleRadioValueChange3,
                              ),
                              GestureDetector(
                                onTap: () {
                                  _handleRadioValueChange3(2);
                                },
                                child: Text("C.   Mixed"),
                              ),
                            ],
                          ),
                        ),
                        new Divider(
                          height: 5.0,
                          color: Colors.black,
                        ),
                        new Padding(
                          padding: new EdgeInsets.all(8.0),
                        ),
                        new Image(
                            image:
                                AssetImage('assets/images/mixedFraction.png')),
                        Container(
                          padding:
                              new EdgeInsets.fromLTRB(20.0, 16.0, 6.0, 8.0),
                          color: Colors.indigo[100],
                          child: new Text(
                            '4.   What type of the fraction given is?',
                            style: new TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 18.0,
                            ),
                          ),
                        ),
                        Container(
                          color: Colors.indigo[100],
                          child: new Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              new Radio(
                                value: 0,
                                groupValue: _radioValue4,
                                onChanged: _handleRadioValueChange4,
                              ),
                              GestureDetector(
                                onTap: () {
                                  _handleRadioValueChange4(0);
                                },
                                child: Text("A.  Mixed"),
                              ),
                              new Radio(
                                value: 1,
                                groupValue: _radioValue4,
                                onChanged: _handleRadioValueChange4,
                              ),
                              GestureDetector(
                                onTap: () {
                                  _handleRadioValueChange4(1);
                                },
                                child: Text("B.  Proper"),
                              ),
                              new Radio(
                                value: 2,
                                groupValue: _radioValue4,
                                onChanged: _handleRadioValueChange4,
                              ),
                              GestureDetector(
                                onTap: () {
                                  _handleRadioValueChange4(2);
                                },
                                child: Text("C.  Like"),
                              ),
                            ],
                          ),
                        ),
                        new Divider(
                          height: 5.0,
                          color: Colors.black,
                        ),
                        new Padding(
                          padding: new EdgeInsets.all(8.0),
                        ),
                        new Image(
                            image:
                                AssetImage('assets/images/wholeFraction.png')),
                        Container(
                          color: Colors.brown[200],
                          padding:
                              new EdgeInsets.fromLTRB(20.0, 16.0, 6.0, 8.0),
                          child: new Text(
                            '5.   Which value is the numerator?',
                            style: new TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 18.0,
                            ),
                          ),
                        ),
                        Container(
                          color: Colors.brown[200],
                          child: new Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              new Radio(
                                value: 0,
                                groupValue: _radioValue5,
                                onChanged: _handleRadioValueChange5,
                              ),
                              GestureDetector(
                                onTap: () {
                                  _handleRadioValueChange5(0);
                                },
                                child: Text("A. 2"),
                              ),
                              new Radio(
                                value: 1,
                                groupValue: _radioValue5,
                                onChanged: _handleRadioValueChange5,
                              ),
                              GestureDetector(
                                onTap: () {
                                  _handleRadioValueChange5(1);
                                },
                                child: Text("B. 7"),
                              ),
                              new Radio(
                                value: 2,
                                groupValue: _radioValue5,
                                onChanged: _handleRadioValueChange5,
                              ),
                              GestureDetector(
                                onTap: () {
                                  _handleRadioValueChange5(2);
                                },
                                child: Text("C. 1"),
                              ),
                            ],
                          ),
                        ),
                        new Divider(
                          height: 5.0,
                          color: Colors.black,
                        ),
                        new Padding(
                          padding: new EdgeInsets.all(8.0),
                        ),
                        new RaisedButton(
                          onPressed: validateAnswers,
                          child: new Text(
                            'Submit Quiz',
                            style: new TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.white70),
                          ),
                          color: Colors.red[300],
                          shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(20.0)),
                        ),
                        new Padding(
                          padding: EdgeInsets.all(4.0),
                        ),
                        new RaisedButton(
                          onPressed: resetSelection,
                          child: new Text(
                            'Reset Selection',
                            style: new TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 16.0,
                                color: Colors.white),
                          ),
                          color: Colors.green[300],
                          shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(20.0)),
                        ),
                        SizedBox(
                          height: 20,
                        )
                      ]),
                ))));
  }

  void resetSelection() {
    _handleRadioValueChange1(-1);
    _handleRadioValueChange2(-1);
    _handleRadioValueChange3(-1);
    _handleRadioValueChange4(-1);
    _handleRadioValueChange5(-1);
    correctScore = 0;
  }

  void validateAnswers() async {
    correctScore = ansResult.fold(0, (prev, element) => prev + element);

    if (_radioValue1 == -1 ||
        _radioValue2 == -1 ||
        _radioValue3 == -1 ||
        _radioValue4 == -1 ||
        _radioValue5 == -1) {
      Fluttertoast.showToast(
          msg: 'Please finish the quiz before submit !',
          toastLength: Toast.LENGTH_SHORT);
    } else {
      Fluttertoast.showToast(
          msg: 'Your total score is: $correctScore out of 5',
          toastLength: Toast.LENGTH_LONG);
      user.result2 = correctScore;
      setState(() {
        if (user.quizCount == 1) user.quizCount++;
        status = 1;
      });
      showProgress(context, 'Updating result...', false);
      await _fireStoreUtils.updateCurrentUser(user, context);
      hideProgress();
      Navigator.of(context).pop(status);
    }
  }
}
