import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Chap1Quiz1 extends StatefulWidget {
  @override
  _Chap1Quiz1State createState() => _Chap1Quiz1State();
}

class _Chap1Quiz1State extends State<Chap1Quiz1> {
  int _radioValue1 = -1;
  int correctScore = 0;
  int _radioValue2 = -1;
  int _radioValue3 = -1;
  int _radioValue4 = -1;
  int _radioValue5 = -1;

  void _handleRadioValueChange1(int value) {
    setState(() {
      _radioValue1 = value;

      switch (_radioValue1) {
        case 0:
          Fluttertoast.showToast(
              msg: 'You are AWESOME !', toastLength: Toast.LENGTH_SHORT);
          correctScore++;
          break;
        case 1:
          Fluttertoast.showToast(
              msg: 'Try again !', toastLength: Toast.LENGTH_SHORT);
          break;
        case 2:
          Fluttertoast.showToast(
              msg: 'Try again !', toastLength: Toast.LENGTH_SHORT);
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
          break;
        case 1:
          Fluttertoast.showToast(
              msg: 'You are AWESOME !', toastLength: Toast.LENGTH_SHORT);
          correctScore++;
          break;
        case 2:
          Fluttertoast.showToast(
              msg: 'Try again !', toastLength: Toast.LENGTH_SHORT);
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
          break;
        case 1:
          Fluttertoast.showToast(
              msg: 'You are such a genius !', toastLength: Toast.LENGTH_SHORT);
          correctScore++;
          break;
        case 2:
          Fluttertoast.showToast(
              msg: 'Try again !', toastLength: Toast.LENGTH_SHORT);
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
          correctScore++;
          break;
        case 1:
          Fluttertoast.showToast(
              msg: 'Try again !', toastLength: Toast.LENGTH_SHORT);
          break;
        case 2:
          Fluttertoast.showToast(
              msg: 'Try again !', toastLength: Toast.LENGTH_SHORT);
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
          break;
        case 1:
          Fluttertoast.showToast(
              msg: 'Try again !', toastLength: Toast.LENGTH_SHORT);
          break;
        case 2:
          Fluttertoast.showToast(
              msg: 'Congratulations !', toastLength: Toast.LENGTH_SHORT);
          correctScore++;
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: new Scaffold(
            appBar: AppBar(
              title: new Text('Chapter 1 Quiz 1'),
              centerTitle: true,
              backgroundColor: Colors.blue,
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
                          'Select correct answers from below based on the diagram given:',
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
                            image: AssetImage('assets/images/ingredient.png')),
                        new Text(
                          'The following segment represents... ',
                          style: new TextStyle(
                            fontWeight: FontWeight.bold,
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
                              new Text(
                                'How many segment left here? ',
                                style: new TextStyle(
                                  fontWeight: FontWeight.bold,
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
                                    new Text(
                                      'How do we name this fraction?',
                                      style: new TextStyle(
                                        fontWeight: FontWeight.bold,
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
                                        new Text(
                                          'What is the name of this fraction?',
                                          style: new TextStyle(
                                            fontWeight: FontWeight.bold,
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
                                            new Text(
                                              'what fraction is missing in the following chart?',
                                              style: new TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18.0,
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
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    color: Colors.white),
                                              ),
                                              color:
                                                  Theme.of(context).accentColor,
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
                                              color: Colors.orange[300],
                                              shape: new RoundedRectangleBorder(
                                                  borderRadius:
                                                      new BorderRadius.circular(
                                                          20.0)),
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

  void validateAnswers() {
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
      Navigator.of(context).pop();
    }
  }
}
