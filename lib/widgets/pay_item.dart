import 'package:flutter/material.dart';
import 'package:gtnm/models/product_model.dart';
import 'package:gtnm/screens/detail.dart';
import 'package:gtnm/ultis/money_format.dart';

class PayItem extends StatelessWidget{
  PayItem({required this.model});
  ProductModel model;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Row(
            children: [
              Image(
                image: NetworkImage(model.image),
                width: 100,
                height: 100,
              ),
              SizedBox(width: 10,),
              Expanded(
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(model.ten,),
                      SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(toMoney(model.gia.toDouble()), style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),),
                          Text('Số lượng: ' + model.soluong.toString(), style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),),
                        ],
                      ),
                      
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      onTap: (){},
    );
  }
}