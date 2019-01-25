import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import '../util/utils.dart' as util;

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
                child: updateTempWidget(
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
    // TODO 5: Create updateWeatherWidget() that returns a FutureBuilder
  }
  Future<Map> getWeather(String appId, String city) async {
    String apiUrl =
        'http://api.openweathermap.org/data/2.5/weather?q=$city&appid='
        '${util.appId}&units=imperial';

    http.Response response = await http.get(apiUrl);

    return json.decode(response.body);
  }

  Widget updateTempWidget(String city) {
    return new FutureBuilder(
        future: getWeather(util.appId, city == null ? util.defaultCity : city),
        builder: (BuildContext context, AsyncSnapshot<Map> snapshot) {
          //where we get all of the json data, we setup widgets etc.
          if (snapshot.hasData) {
            Map content = snapshot.data;
            return new Container(
              margin: const EdgeInsets.fromLTRB(30.0, 250.0, 0.0, 0.0),
              child: new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new ListTile(
                    title: new Text(
                      content['main']['temp'].toString() +" F",
                      style: new TextStyle(
                          fontStyle: FontStyle.normal,
                          fontSize: 49.9,
                          color: Colors.white,
                          fontWeight: FontWeight.w500),
                    ),
                    subtitle: new ListTile(
                      title: new Text(
                        "Humidity: ${content['main']['humidity'].toString()}\n"
                            "Min: ${content['main']['temp_min'].toString()} F\n"
                            "Max: ${content['main']['temp_max'].toString()} F ",

                        style: (),

                      ),
                    ),
                  )
                ],
              ),
            );
          } else {
            return new Container();
          }
        });
  }
}




