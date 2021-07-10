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
  List<String> _selected = [];

  @override
  void initState() {
    super.initState();
  }

  Future<List<ProductModel>> _loadCart() async {
    // return  await loadCartData();
    return m_cart;
  }

  Future<List<ProductModel>> _getPaymentList() async{
    List<ProductModel> list = [];
    for(var item in m_cart){
      if(_selected.contains(item.id)) list.add(item);
    }
    return list;
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
                      if(_selected.contains(item.id)) {
                        _total += (item.gia * item.soluong) as int;
                      }
                      return Container(
                        padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child: CartItem(
                          model: item,
                          onSoLuong: (value) => setState((){}),
                          onSelect: (value) => setState((){
                            if(value) _selected.add(item.id);
                            else _selected.remove(item.id);
                          })
                        )
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
                          onPressed: () async {
                            _getPaymentList().then((value) {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => PaymentScreen(list: value,)));
                            });
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
