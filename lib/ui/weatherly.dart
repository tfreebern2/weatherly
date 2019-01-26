import 'package:flutter/material.dart';
import 'package:weatherly/ui/changecity.dart';

import '../util/utils.dart' as util;

class Weatherly extends StatefulWidget {
  @override
  _WeatherlyState createState() => _WeatherlyState();
}

class _WeatherlyState extends State<Weatherly> {
  String _cityEntered;

  Future _goToCityPage(BuildContext context) async {
    Map results = await Navigator
        .of(context)
        .push(MaterialPageRoute<Map>(builder: (BuildContext context) { //change to Map instead of dynamic for this to work
      return ChangeCity();
    }));

    if ( results != null && results.containsKey('enter')) {
      _cityEntered = results['enter'];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weatherly'),
        backgroundColor: Colors.redAccent,
        actions: <Widget>[IconButton(icon: Icon(Icons.menu), onPressed: () {
          _goToCityPage(context);
        },)],
      ),
      backgroundColor: Colors.white70,
      body: ListView(
        children: <Widget>[
          Column(
            children: <Widget>[
              // TODO 6: Replace City and Temp Widgets with updateCityWidget()
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  '${_cityEntered == null ? util.defaultCity : _cityEntered}',
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
            ],
          )
        ],
      ),
    );
  }
  // TODO 4: Create getWeather() that returns JSON response body


  // TODO 5: Create updateCityWidget() that returns a FutureBuilder


}




