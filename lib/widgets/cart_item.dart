import 'package:flutter/material.dart';
import 'package:gtnm/models/product_model.dart';
import 'package:gtnm/screens/detail.dart';

class CartItem extends StatelessWidget{
  CartItem({required this.model});
  ProductModel model;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Row(
        children: [
          Image(
            image: NetworkImage(model.image),
            width: 100,
            height: 100,
          ),
          Column(
            children: [
              Text(model.ten),
              Text(model.gia.toString()),
            ],
          ),
        ],),
      onTap: (){},
    );
  }
}