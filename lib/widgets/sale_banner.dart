import 'package:flutter/material.dart';

class SaleBanner extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).accentColor,
      height: 200,
      child: Center(child: Text('Sale banner'),),
    );
  }
}