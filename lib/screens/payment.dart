import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gtnm/models/product_model.dart';
import 'package:gtnm/ultis/loadJson.dart';
import 'package:gtnm/widgets/pay_item.dart';

class PaymentScreen extends StatefulWidget {
  PaymentScreen({Key? key}) : super(key: key);

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
    return  await loadCartData();
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
    _total = _tax = 0;
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
                              Text('Thong tin lien he', style: TextStyle(fontWeight: FontWeight.bold),),
                              SizedBox(height: 10,),
                              InkWell(
                                child: Container(
                                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: Colors.blue[50],
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text('Ho ten'),
                                        Text('Dia chi'),
                                        Text('So dien thoai'),
                                        Text('ghi chu'),
                                      ]
                                  ),
                                ),
                                onTap: (){},
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
                              Text('Danh sách', style: TextStyle(fontWeight: FontWeight.bold),),
                              SizedBox(height: 10,),
                              ListView(
                                shrinkWrap: true,
                                physics: ScrollPhysics(),
                                children: snapshot.data!.map((item) {
                                  _total += item.gia;
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
                                  Text(_total.toString()),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Tax'),
                                  Text(_tax.toString()),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Tong cong'),
                                  Text((_total + _tax).toString()),
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
                          (_total + _tax).toString().toString(),
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          )
                      ),
                      SizedBox(width: 10,),
                      ElevatedButton(
                        onPressed: (){},
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
