import 'package:flutter/material.dart';
import 'package:gtnm/models/product_model.dart';
import 'package:gtnm/screens/detail.dart';

class CategoryItem extends StatelessWidget{
  CategoryItem({required this.model});
  ProductModel model;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Card(
        child: Column(
          children: [
            Image(
              image: NetworkImage(model.image),
            ),
            Text(model.ten),
            Text(model.gia.toString()),
          ],),
      ),
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => DetailScreen()));
      },
    );
  }
}