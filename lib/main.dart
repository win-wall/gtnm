import 'package:flutter/material.dart';
import 'package:gtnm/screens/app.dart';
import 'package:gtnm/ultis/loadJson.dart';
import 'package:gtnm/ultis/theme.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ban hang',
      theme: AppTheme(),
      home: AppScreen(),
    );
  }
}