import 'package:flutter/material.dart';
import 'package:weatherly/ui/weatherly.dart';

void main() => runApp(MaterialApp(theme: ThemeData.light(), home: Weatherly()));

// TODO 1: Create util package under library directory
// TODO 2: In utils.dart add AppID and defaultCity final variables
// TODO 3: Add utils.dart to .gitignore