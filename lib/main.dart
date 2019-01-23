import 'package:flutter/material.dart';

// TODO 1: Change name of myApp to Weatherly
void main() => runApp(MyApp());

// TODO 2: Convert Weatherly StatelessWidget to a StatefulWidget
// TODO 3: Extract Weatherly StatefulWidget into a separate Dart file
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Home Page',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
