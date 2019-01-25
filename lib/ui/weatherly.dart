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
                padding: const EdgeInsets.all(20.0),
                child: updateCityWidget(_changeCityController.text),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(left: 30.0, right: 30.0, top: 30.0),
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
                padding: const EdgeInsets.all(8.0),
                child: RaisedButton(
                  onPressed: () {
                    getWeather(util.appId, _changeCityController.text);
                    setState(() {});
                  },
                  textColor: Colors.white,
                  color: Colors.redAccent,
                  child: Text('Get Weather'),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Future<Map> getWeather(String appId, String city) async {
    String apiUrl =
        'http://api.openweathermap.org/data/2.5/weather?q=$city&appid='
        '${util.appId}&units=imperial';

    http.Response response = await http.get(apiUrl);
//    print(json.decode(response.body));
    return json.decode(response.body);
  }

  Widget updateCityWidget(String city) {
    return FutureBuilder(
      future: getWeather(util.appId, city == '' ? util.defaultCity : city),
      builder: (BuildContext context, AsyncSnapshot<Map> snapshot) {
        if (snapshot.hasData) {
          Map content = snapshot.data;
          return Column(
            children: <Widget>[
              Text('${content['name']}',
                  style: TextStyle(color: Colors.black, fontSize: 32.0)),
              Text(
                content['main']['temp'].toString() + " F",
                style: TextStyle(
                    fontStyle: FontStyle.normal,
                    fontSize: 49.9,
                    color: Colors.black,
                    fontWeight: FontWeight.w500),
              ),
              Text(
                "Current: ${content['main']['temp'].toString()} F\n"
                    "Humidity: ${content['main']['humidity'].toString()}\n"
                    "Min: ${content['main']['temp_min'].toString()} F\n"
                    "Max: ${content['main']['temp_max'].toString()} F ",
                style: TextStyle(color: Colors.black),
              ),
            ],
          );
        } else {
          return Text(
            '${util.defaultCity}',
            style: TextStyle(color: Colors.black, fontSize: 32.0),
          );
        }
      },
    );
  }
}
