import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:gtnm/models/product_model.dart';
import 'package:gtnm/screens/detail.dart';
import 'package:gtnm/ultis/money_format.dart';
import 'package:gtnm/widgets/rate_start.dart';

class CategoryItem extends StatelessWidget{
  CategoryItem({required this.model});
  ProductModel model;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Card(
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Container(               
                width: MediaQuery.of(context).size.width * 0.3,
                height: MediaQuery.of(context).size.width * 0.3,
                // decoration: BoxDecoration(
                //   border: Border.all(),
                // ),
                child: Image(
                  image: NetworkImage(model.image),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10,),
                  Text(model.ten, style: TextStyle(fontSize: 16),),
                  SizedBox(height: 10,),
                  Text(toMoney(model.gia.toDouble()),
                  style: TextStyle(fontWeight: FontWeight.bold),),
                  SizedBox(height: 10,),
                  RateStart(rate: 4.5),
                  ],
              ),
              ],),
        ),
      ),
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => DetailScreen()));
      },
    );
  }
}