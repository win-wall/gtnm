import 'package:flutter/material.dart';

class RateStart extends StatelessWidget{
  RateStart({this.rate = 0, this.size = 16, this.showText = true});
  double rate;
  double size;
  bool showText;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          Icons.star,
          color: rate < 1 ?Colors.grey : Colors.amber,
          size: size,
        ),
        SizedBox(width: size/8),
        Icon(
          Icons.star,
          color: rate < 2 ?Colors.grey : Colors.amber,
          size: size,
        ),
        SizedBox(width: size/8),
        Icon(
          Icons.star,
          color: rate < 3 ?Colors.grey : Colors.amber,
          size: size,
        ),
        SizedBox(width: size/8),
        Icon(
          Icons.star,
          color: rate < 4 ?Colors.grey : Colors.amber,
          size: size,
        ),
        SizedBox(width: size/8),
        Icon(
          Icons.star,
          color: rate < 5 ?Colors.grey : Colors.amber,
          size: size,
        ),
        if(showText) SizedBox(width: size/8),
        if(showText) Text(rate.toString() + "/5",
          style: TextStyle(
            color: Colors.black,
            fontSize: size*0.8,
            fontWeight: FontWeight.w200))
      ],
    );                
  }  
}