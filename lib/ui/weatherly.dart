import 'package:flutter/material.dart';

class Weatherly extends StatefulWidget {
  @override
  _WeatherlyState createState() => _WeatherlyState();
}

class _WeatherlyState extends State<Weatherly> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weatherly'),
        backgroundColor: Colors.redAccent,
      ),
      body: Stack(
        children: <Widget>[
          Center(
            child: Image.asset(
              'images/umbrella.png',
              width: 490.0,
              height: 1200.0,
              fit: BoxFit.fill,
            ),
          ),
          Container(
            alignment: Alignment.topLeft,
            child: Text(
              'Orlando',
              style: TextStyle(color: Colors.white, fontSize: 32.0),
            ),
          ),
          Container(
            alignment: Alignment.center,
            child: Text(
              'Current Temp: 85.0\n'
                  'Humidity: 81\n'
                  'Min Temp: 62.0\n'
                  'Max Temp: 90.0',
              style: TextStyle(color: Colors.white, fontSize: 22.0),
            ),
          )
        ],
      ),
    );
  }
}
