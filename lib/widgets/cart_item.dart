import 'package:flutter/material.dart';
import 'package:gtnm/models/product_model.dart';
import 'package:gtnm/screens/detail.dart';
import 'package:gtnm/ultis/money_format.dart';


typedef _SoLuongCallback(int);
typedef _SelectCallback(bool);

class CartItem extends StatefulWidget {
  CartItem({Key? key ,required this.model, required this.onSoLuong, required this.onSelect}) : super(key: key);

  ProductModel model;
  _SoLuongCallback onSoLuong;
  _SelectCallback onSelect;

  @override
  _CartItemState createState() => _CartItemState();
}

class _CartItemState extends State<CartItem>{
  bool _selected = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Card(
        child: Container(
          padding: EdgeInsets.all(10),
          child: Row(
              children: [
                Checkbox(
                  value: _selected,
                  onChanged: (val){
                    setState(() {
                      _selected = val!;
                    });
                    widget.onSelect(_selected);
                  }
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
                          IconButton(
                            icon: Icon(Icons.remove_circle),
                            onPressed: () {
                              setState(() {
                                if(widget.model.soluong > 1)
                                  widget.model.soluong--;
                              });
                              widget.onSoLuong(widget.model.soluong);
                            },
                          ),
                          Text(widget.model.soluong.toString()),
                          IconButton(
                            icon: Icon(Icons.add_circle),
                            onPressed: () {
                              setState(() {
                                widget.model.soluong++;
                              });
                              widget.onSoLuong(widget.model.soluong);
                            },
                          ),
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