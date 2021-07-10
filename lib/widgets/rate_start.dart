import 'package:flutter/material.dart';

class RateStart extends StatelessWidget{
  RateStart({this.rate = 0});
  double rate;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          Icons.star,
          color: rate < 1 ?Colors.grey : Colors.amber,
          size: 16,
        ),
        SizedBox(width: 2),
        Icon(
          Icons.star,
          color: rate < 2 ?Colors.grey : Colors.amber,
          size: 16,
        ),
        SizedBox(width: 2),
        Icon(
          Icons.star,
          color: rate < 3 ?Colors.grey : Colors.amber,
          size: 16,
        ),
        SizedBox(width: 2),
        Icon(
          Icons.star,
          color: rate < 4 ?Colors.grey : Colors.amber,
          size: 16,
        ),
        SizedBox(width: 2),

        Icon(
          Icons.star,
          color: rate < 5 ?Colors.grey : Colors.amber,
          size: 16,
        ),
        SizedBox(width: 2),
        Text(rate.toString() + "/5",
          style: TextStyle(
            color: Colors.black,
            fontSize: 12,
            fontWeight: FontWeight.w100))
      ],
    );                
  }  
}