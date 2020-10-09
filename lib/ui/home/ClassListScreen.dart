import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fractastic/model/User.dart';
import 'package:fractastic/ui/services/Authenticate.dart';
import 'package:fractastic/ui/utils/helper.dart';
import 'package:provider/provider.dart';
import 'package:fractastic/ui/home/ClassList.dart';
import 'package:fractastic/model/Class.dart';
import 'package:uuid/uuid.dart';
import '../../main.dart';
import '../../constants.dart' as Constants;

String _className;
Class classCreated;
var uuid = Uuid();
String _uuid;
FireStoreUtils _fireStoreUtils = FireStoreUtils();

class ClassListScreen extends StatefulWidget {
  ClassListScreen({Key key}) : super(key: key);

  @override
  _ClassListScreenState createState() => _ClassListScreenState();
}

class _ClassListScreenState extends State<ClassListScreen> {
  final _formKey = GlobalKey<FormState>();
  _ClassListScreenState();

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Class>>.value(
      value: FireStoreUtils().classes,
      child: Scaffold(
        body: ClassList(),
        backgroundColor: Colors.blueGrey[50],
        floatingActionButton: Container(
          child: FittedBox(
            child: FloatingActionButton(
                child: Icon(Icons.add),
                backgroundColor: Color(Constants.COLOR_PRIMARY),
                onPressed: () async {
                  await _createAlertDialog(context);
                }),
          ),
        ),
      ),
    );
  }

  Future _createAlertDialog(BuildContext context) async {
    return showDialog(
      context: context,
      barrierDismissible:
          true, // dialog is dismissible with a tap on the barrier
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Create Class'),
          content: Stack(
            overflow: Overflow.visible,
            children: <Widget>[
              Positioned(
                right: -40.0,
                top: -80.0,
                child: InkResponse(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: CircleAvatar(
                    child: Icon(Icons.close),
                    backgroundColor: Colors.red,
                  ),
                ),
              ),
              Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Class Name',
                          contentPadding:
                              EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                        ),
                        validator: validateClassName,
                        onChanged: (val) => setState(() => _className = val),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: RaisedButton(
                        child: Text("Create"),
                        onPressed: () async {
                          //print(_className + "printing");
                          if (_formKey.currentState.validate()) {
                            setState(() {
                              _uuid = uuid.v1();
                              classCreated = Class(
                                  name: _className,
                                  teacherId: MyAppState.currentUser.uid,
                                  classCode: _uuid.substring(0, 7));
                              MyAppState.currentUser.classCode =
                                  classCreated.classCode;
                            });
                            await _fireStoreUtils.updateClassData(
                                classCreated, context);
                            Navigator.pop(context);
                          }
                        },
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
