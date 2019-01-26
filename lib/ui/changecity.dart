import 'package:flutter/material.dart';

class ChangeCity extends StatelessWidget {
  var _changeCityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.redAccent,
          title: Text('Change City'),
        ),
        body: ListView(children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 30.0, right: 30.0, top: 10.0),
            child: TextField(
              decoration: InputDecoration(
                  hintText: 'Enter City',
                  hintStyle: TextStyle(color: Colors.black)),
              maxLength: 30,
              controller: _changeCityController,
              keyboardType: TextInputType.text,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: RaisedButton(
              onPressed: () {
                debugPrint(_changeCityController.text);
              },
              textColor: Colors.white,
              color: Colors.green,
              child: Text('Get Weather'),
            ),
          ),
        ]));
  }
}
