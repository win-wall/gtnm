import 'package:flutter/material.dart';
import 'package:gtnm/models/product_model.dart';
import 'package:gtnm/screens/payment.dart';
import 'package:gtnm/ultis/global.dart';
import 'package:gtnm/ultis/loadJson.dart';
import 'package:gtnm/ultis/money_format.dart';
import 'package:gtnm/widgets/cart_item.dart';

class CartScreen extends StatefulWidget {
  CartScreen({Key? key}) : super(key: key);

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen>{
  int _total = 0;

  @override
  void initState() {
    super.initState();
  }

  Future<List<ProductModel>> _loadCart() async {
    return  await loadCartData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Giỏ Hàng'),
        actions: [
          IconButton(
            onPressed: (){},
            icon: Icon(Icons.delete),
          ),
        ],
      ),
      body: FutureBuilder(
          future: _loadCart(),
          builder: (context, AsyncSnapshot<List<ProductModel>> snapshot) {
            if (!snapshot.hasData)
              return Center(child: CircularProgressIndicator(),);
            _total = 0;
            return Column(
              children: [
                Expanded(
                  child: ListView(
                    children: snapshot.data!.map((item) {
                      _total += item.gia * item.soluong;
                      return Container(
                        padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child: CartItem(model: item)
                      );
                    }).toList(),
                  ),
                ),
                Container(
                    padding: EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text('Tổng cộng:'),
                        SizedBox(width: 10,),
                        Text(
                            toMoney(_total.toDouble()),
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            )
                        ),
                        SizedBox(width: 10,),
                        ElevatedButton(
                          child: Text('Thanh Toán'),
                          onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => PaymentScreen()));
                          },
                        ),
                      ],
                    )
                ),
              ],
            );
          }
      )
    );
  }
}
