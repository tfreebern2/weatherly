import 'package:flutter/material.dart';

class Weatherly extends StatefulWidget {
  @override
  _WeatherlyState createState() => _WeatherlyState();
}

class _WeatherlyState extends State<Weatherly> {
  var _changeCityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weatherly'),
        backgroundColor: Colors.redAccent,
      ),
      backgroundColor: Colors.white70,
      body: ListView(
        children: <Widget>[
          Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Orlando',
                  style: TextStyle(color: Colors.black, fontSize: 32.0),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Current Temp: 85.0\n'
                      'Humidity: 81\n'
                      'Min Temp: 62.0\n'
                      'Max Temp: 90.0',
                  style: TextStyle(color: Colors.black, fontSize: 22.0),
                ),
              ),
              Padding(
                padding:
                const EdgeInsets.only(left: 30.0, right: 30.0, top: 10.0),
                child: TextField(
                  decoration: InputDecoration(
                      hintText: 'Enter City',
                      hintStyle: TextStyle(color: Colors.black)),
                  maxLength: 30,
                  controller: _changeCityController,
                  keyboardType: TextInputType.text,
                ),
              ),
              RaisedButton(onPressed: () {
                debugPrint(_changeCityController.text);
              },
                textColor: Colors.white,
                color: Colors.redAccent,
                child: Text('Get Weather'),
              )
            ],
          )
        ],
      ),
    );
  }
  // TODO 4: Create getWeather() that returns JSON response body


  // TODO 5: Create updateWeatherWidget() that returns a FutureBuilder


}




