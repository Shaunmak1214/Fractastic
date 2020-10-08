import 'package:flutter/material.dart';
import 'package:fractastic/constants.dart' as Constants;

class BlankPage extends StatelessWidget {
  String _currentClassCode;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Fractastic'),
          centerTitle: true,
          backgroundColor: Color(Constants.COLOR_PRIMARY)),
      body: new Column(
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: SizedBox(height: 60.0),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: new Image(
              image: AssetImage('assets/images/construction.png'),
            ),
          )
        ],
      ),
      floatingActionButton: Container(
          height: 60.0,
          width: 60.0,
          child: FittedBox(
            child: FloatingActionButton(
                child: Icon(Icons.add),
                backgroundColor: Color(Constants.COLOR_ACCENT),
                onPressed: () {
                  _asyncJoinClassDialog(context);
                }),
          ),
    );
  }

  Future _asyncJoinClassDialog(BuildContext context) async {
    return showDialog(
      context: context,
      barrierDismissible:
          true, // dialog is dismissible with a tap on the barrier
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Jpin Class'),
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
                          hintText: 'Class code',
                          contentPadding:
                              EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                        ),
                        validator: validateClassCode,
                        onChanged: (val) =>
                            setState(() => _currentClassCode = val),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: RaisedButton(
                        child: Text("Join"),
                        onPressed: () async {
                          if (_formKey.currentState.validate()) {
                            setState(() {
                              user.classCode =
                                  _currentClassCode ?? user.classCode;
                            });
                            await _fireStoreUtils.updateCurrentUser(
                                user, context);
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
