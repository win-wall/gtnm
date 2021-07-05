import 'package:flutter/material.dart';

class OnlineSupportScreen extends StatefulWidget {
  OnlineSupportScreen({Key? key}) : super(key: key);

  @override
  _OnlineSupportScreenState createState() => _OnlineSupportScreenState();
}

class _OnlineSupportScreenState extends State<OnlineSupportScreen>{
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tư Vấn'),
      ),
      body: Center(
        child: Text('2'),
      ),
    );
  }
}
