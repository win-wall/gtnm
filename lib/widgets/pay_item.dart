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
              Container(
                width: MediaQuery.of(context).size.width * 0.3,
                height: MediaQuery.of(context).size.width * 0.3,
                child: Image(
                  image: NetworkImage(model.image),
                  fit: BoxFit.contain
                ),
              ),
              SizedBox(width: 10,),
              Expanded(
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(model.ten,),
                      SizedBox(height: 16,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(toMoney(model.gia.toDouble()), style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),),
                          Text('Số lượng: ' + model.soluong.toString(), style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),),
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