import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:fractastic/ui/services/Authenticate.dart';
import 'package:fractastic/model/User.dart';
import 'package:fractastic/main.dart';
import 'package:fractastic/ui/utils/helper.dart';
import '../../../constants.dart' as Constants;

var result3;
FireStoreUtils _fireStoreUtils = FireStoreUtils();

class Chap3Quiz extends StatefulWidget {
  @override
  _Chap3QuizState createState() => _Chap3QuizState();
}

class _Chap3QuizState extends State<Chap3Quiz> {
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
              title: new Text('Chapter 3 Quiz'),
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
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new Text(
                          'Select correct answers from below:',
                          style: new TextStyle(
                              fontSize: 20.0, fontWeight: FontWeight.bold),
                        ),
                        new Padding(
                          padding: new EdgeInsets.all(8.0),
                        ),
                        new Divider(height: 5.0, color: Colors.black),
                        new Padding(
                          padding: new EdgeInsets.all(8.0),
                        ),
                        new Image(
                            image: AssetImage('assets/images/twoOverFive.png')),
                        new Text(
                          '1.   The following segment represents... ',
                          style: new TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 18.0,
                          ),
                        ),
                        new Row(
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
                              child: Text("A.   2/5"),
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
                              child: Text("B.   1/5"),
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
                              child: Text("C.   1/2"),
                            ),
                          ],
                        ),
                        new Divider(
                          height: 5.0,
                          color: Colors.black,
                        ),
                        new Padding(
                          padding: new EdgeInsets.all(8.0),
                        ),
                        new Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              new Image(
                                  image: AssetImage(
                                      'assets/images/sevenOverEight.png')),
                              new Text(
                                '2.   How many segment left here? ',
                                style: new TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18.0,
                                ),
                              ),
                              new Row(
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
                                    child: Text("A.   5/8"),
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
                                    child: Text("B.   7/8"),
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
                                    child: Text("C.   1/8"),
                                  ),
                                ],
                              ),
                              new Divider(
                                height: 5.0,
                                color: Colors.black,
                              ),
                              new Padding(
                                padding: new EdgeInsets.all(8.0),
                              ),
                              new Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    new Image(
                                        image: AssetImage(
                                            'assets/images/oneThird.png')),
                                    new Text(
                                      '3.   How do we name this fraction?',
                                      style: new TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 18.0,
                                      ),
                                    ),
                                    new Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
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
                                          child: Text("A.   Half"),
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
                                          child: Text("B.   One-Third"),
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
                                          child: Text("C.   Fifth-Third"),
                                        ),
                                      ],
                                    ),
                                    new Divider(
                                      height: 5.0,
                                      color: Colors.black,
                                    ),
                                    new Padding(
                                      padding: new EdgeInsets.all(8.0),
                                    ),
                                    new Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        new Image(
                                            image: AssetImage(
                                                'assets/images/fourOverFive.png')),
                                        new Text(
                                          '4.   What is the name of this fraction?',
                                          style: new TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 18.0,
                                          ),
                                        ),
                                        new Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: <Widget>[
                                            new Radio(
                                              value: 0,
                                              groupValue: _radioValue4,
                                              onChanged:
                                                  _handleRadioValueChange4,
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                _handleRadioValueChange4(0);
                                              },
                                              child: Text(
                                                  "A.Forth-Fifths"), //four or forth???
                                            ),
                                            new Radio(
                                              value: 1,
                                              groupValue: _radioValue4,
                                              onChanged:
                                                  _handleRadioValueChange4,
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                _handleRadioValueChange4(1);
                                              },
                                              child: Text("B.One-Third"),
                                            ),
                                            new Radio(
                                              value: 2,
                                              groupValue: _radioValue4,
                                              onChanged:
                                                  _handleRadioValueChange4,
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                _handleRadioValueChange4(2);
                                              },
                                              child: Text("C.One-Forths"),
                                            ),
                                          ],
                                        ),
                                        new Divider(
                                          height: 5.0,
                                          color: Colors.black,
                                        ),
                                        new Padding(
                                          padding: new EdgeInsets.all(8.0),
                                        ),
                                        new Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: <Widget>[
                                            new Image(
                                                image: AssetImage(
                                                    'assets/images/sevenOverEight.png')),
                                            Container(
                                              padding: new EdgeInsets.fromLTRB(
                                                  20.0, 16.0, 6.0, 8.0),
                                              child: new Text(
                                                '5.   What fraction is missing in the following chart?',
                                                style: new TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 18.0,
                                                ),
                                              ),
                                            ),
                                            new Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: <Widget>[
                                                new Radio(
                                                  value: 0,
                                                  groupValue: _radioValue5,
                                                  onChanged:
                                                      _handleRadioValueChange5,
                                                ),
                                                GestureDetector(
                                                  onTap: () {
                                                    _handleRadioValueChange5(0);
                                                  },
                                                  child: Text("A. One-Fifth"),
                                                ),
                                                new Radio(
                                                  value: 1,
                                                  groupValue: _radioValue5,
                                                  onChanged:
                                                      _handleRadioValueChange5,
                                                ),
                                                GestureDetector(
                                                  onTap: () {
                                                    _handleRadioValueChange5(1);
                                                  },
                                                  child: Text("B. 2/8"),
                                                ),
                                                new Radio(
                                                  value: 2,
                                                  groupValue: _radioValue5,
                                                  onChanged:
                                                      _handleRadioValueChange5,
                                                ),
                                                GestureDetector(
                                                  onTap: () {
                                                    _handleRadioValueChange5(2);
                                                  },
                                                  child:
                                                      Text("C. One Over Eight"),
                                                ),
                                              ],
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
                                                    color: Colors.white),
                                              ),
                                              color: Colors.red[300],
                                              shape: new RoundedRectangleBorder(
                                                  borderRadius:
                                                      new BorderRadius.circular(
                                                          20.0)),
                                            ),
                                            new Padding(
                                              padding: EdgeInsets.all(4.0),
                                            ),
                                            new RaisedButton(
                                              onPressed: resetSelection,
                                              child: new Text(
                                                'Reset Selection',
                                                style: new TextStyle(
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    fontSize: 16.0,
                                                    color: Colors.white),
                                              ),
                                              color: Colors.green[300],
                                              shape: new RoundedRectangleBorder(
                                                  borderRadius:
                                                      new BorderRadius.circular(
                                                          20.0)),
                                            ),
                                            SizedBox(
                                              height: 20,
                                            )
                                          ],
                                        ),
                                      ],
                                    )
                                  ])
                            ])
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
      user.result3 = correctScore;
      setState(() {
        if (user.quizCount == 2) user.quizCount++;
        status = 1;
      });
      showProgress(context, 'Updating result...', false);
      await _fireStoreUtils.updateCurrentUser(user, context);
      hideProgress();
      Navigator.of(context).pop(status);
    }
  }
}
