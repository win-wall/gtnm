import 'package:flutter/material.dart';
import 'package:gtnm/models/product_model.dart';
import 'package:gtnm/screens/payment.dart';
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

  @override
  Widget build(BuildContext context) {
    _total = 0;
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
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: m_cart.map((item) {
                  _total += item.gia;
                  return CartItem(model: item);
                }).toList(),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      _total.toString(),
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
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
        )
      ),
    );
  }
}
