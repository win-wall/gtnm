import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gtnm/models/product_model.dart';
import 'package:gtnm/screens/success.dart';
import 'package:gtnm/ultis/global.dart';
import 'package:gtnm/ultis/loadJson.dart';
import 'package:gtnm/ultis/money_format.dart';
import 'package:gtnm/widgets/pay_item.dart';

class PaymentScreen extends StatefulWidget {
  PaymentScreen({Key? key, required this.list}) : super(key: key);

  List<ProductModel> list;

  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}
enum _PaymentMethod { cash, eWallet, creditCard }

class _PaymentScreenState extends State<PaymentScreen>{
  int _total = 0;
  int _tax = 0;
  _PaymentMethod _method = _PaymentMethod.cash;



  @override
  void initState() {
    super.initState();
  }

  Future<List<ProductModel>> _loadCart() async {
    // return  await loadCartData();
    // return m_cart;
    return widget.list;
  }

  // ignore: non_constant_identifier_names
  Widget _PaymentItem({text, value}){
    return InkWell(
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.blue[50],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Radio<_PaymentMethod>(
              value: value,
              onChanged: (val){
                setState(() {
                  _method = val as _PaymentMethod;
                });
              },
              groupValue: _method,
            ),
            Text(text),
          ],
        )
      ),
      onTap: (){
        setState(() {
          _method = value;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Thanh Toán'),
      ),
      body: FutureBuilder(
        future: _loadCart(),
        builder: (context, AsyncSnapshot<List<ProductModel>> snapshot) {
          if (!snapshot.hasData)
          return Center(child: CircularProgressIndicator(),);
          print(snapshot.data!.length);
          _total = _tax = 0;
          return Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Thông tin liên hệ', style: TextStyle(fontWeight: FontWeight.bold),),
                              SizedBox(height: 10,),
                              TextField(
                                maxLines: 1,
                                decoration: InputDecoration(
                                    labelText: 'Họ và tên',
                                  )
                              ),
                              TextField(
                                maxLines: 1,
                                decoration: InputDecoration(
                                    labelText: 'Địa chỉ',
                                  )
                              ),
                              TextField(
                                maxLines: 1,
                                keyboardType: TextInputType.phone,
                                decoration: InputDecoration(
                                    labelText: 'Số điện thoại',

                                  )
                              ),
                              SizedBox(height: 20,),

                              // InkWell(
                              //   child: Container(
                              //     padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                              //     width: double.infinity,
                              //     decoration: BoxDecoration(
                              //       color: Colors.blue[50],
                              //       borderRadius: BorderRadius.circular(10),
                              //     ),
                              //     child: Column(
                              //         crossAxisAlignment: CrossAxisAlignment.start,
                              //         children: [
                              //           Text('Họ tên: ' + m_user.hoten),
                              //           Text('Địa chỉ: ' + m_user.diachi),
                              //           Text('Số điện thoại: ' + m_user.sdt),
                              //         ]
                              //     ),
                              //   ),
                              //   onTap: (){},
                              // ),
                            ],
                          ),
                        ),
                        Divider(),
                        Container(
                          padding: EdgeInsets.all(10),
                          width: double.infinity,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Danh sách', style: TextStyle(fontWeight: FontWeight.bold),),
                              SizedBox(height: 10,),
                              ListView(
                                shrinkWrap: true,
                                physics: ScrollPhysics(),
                                children: snapshot.data!.map((item) {
                                  _total += item.gia * item.soluong;
                                  _tax = (_total * 0.1).toInt();
                                  return PayItem(model: item);
                                }).toList(),
                              ),
                              
                            ],
                          ),
                        ),
                        Divider(),
                        Container(
                          padding: EdgeInsets.all(10),
                          width: double.infinity,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Phương thức thanh toán', style: TextStyle(fontWeight: FontWeight.bold),),
                              SizedBox(height: 10,),
                              _PaymentItem(text: 'Tiền mặt', value: _PaymentMethod.cash),
                              SizedBox(height: 10,),
                              _PaymentItem(text: 'Ví điện tử', value: _PaymentMethod.eWallet),
                              SizedBox(height: 10,),
                              _PaymentItem(text: 'Thẻ tín dụng', value: _PaymentMethod.creditCard),
                            ],
                          ),
                        ),
                        Divider(),
                        Container(
                          padding: EdgeInsets.all(10),
                          width: double.infinity,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Tổng thành tiền', style: TextStyle(fontWeight: FontWeight.bold),),
                              SizedBox(height: 10,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Thành tiền'),
                                  Text(toMoney(_total.toDouble())),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Tax (10%)'),
                                  Text(toMoney(_tax.toDouble())),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Tổng cộng'),
                                  Text(toMoney((_total + _tax).toDouble())),
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
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
                          toMoney((_total + _tax).toDouble()),
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          )
                      ),
                      SizedBox(width: 10,),
                      ElevatedButton(
                        onPressed: (){
                          m_cart.clear();
                          Navigator.pop(context);
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SuccessScreen()));
                        },
                        child: Text('Thanh Toán'),
                      ),
                    ],
                  ),
                ),
              ]
          );
        }
      ),
    );
  }
}
