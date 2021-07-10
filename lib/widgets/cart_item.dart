import 'package:flutter/material.dart';
import 'package:gtnm/models/product_model.dart';
import 'package:gtnm/screens/detail.dart';
import 'package:gtnm/ultis/money_format.dart';

class CartItem extends StatefulWidget {
  CartItem({Key? key ,required this.model}) : super(key: key);
  ProductModel model;

  @override
  _CartItemState createState() => _CartItemState();
}

class _CartItemState extends State<CartItem>{  

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Card(
        child: Container(
          padding: EdgeInsets.all(10),
          child: Row(
              children: [
                Checkbox(
                  value: false, 
                  onChanged: (val){}
                ),
                Container(
                  // decoration: BoxDecoration(border: Border.all()),
                  width: MediaQuery.of(context).size.width *0.3,
                  height: MediaQuery.of(context).size.width *0.3,
                  child: Image(
                    image: NetworkImage(widget.model.image),
                    fit: BoxFit.contain,
                  ),
                ),
                SizedBox(width: 10,),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(widget.model.ten, style: TextStyle(fontSize: 16), maxLines: 1, overflow: TextOverflow.ellipsis,),
                      SizedBox(height: 10,),
                      Text(toMoney(widget.model.gia.toDouble()),style: TextStyle(fontWeight: FontWeight.bold),),
                      SizedBox(height: 10,),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          InkWell(onTap: (){
                            setState(() {
                              widget.model.soluong--;
                            });
                          }, child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                            child: Text('-'))),
                          SizedBox(width: 10,),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                            child: Text(widget.model.soluong.toString())),
                          SizedBox(width: 10,),
                          InkWell(onTap: (){
                            setState(() {
                              widget.model.soluong++;
                            });
                          }, child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                            child:Text('+'))),
                        ],
                      ),
                    ],
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