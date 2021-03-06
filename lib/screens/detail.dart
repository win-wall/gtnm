import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gtnm/models/product_model.dart';
import 'package:gtnm/screens/cart.dart';
import 'package:gtnm/ultis/global.dart';
import 'package:gtnm/ultis/money_format.dart';
import 'package:gtnm/widgets/rate_start.dart';

class DetailScreen extends StatefulWidget {
  DetailScreen({required this.model});
  ProductModel model;
  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  void initState() {
    super.initState();
  }

  void _addCart(){
    if(m_cart.contains(widget.model)) return;
    m_cart.add(widget.model);
  }

  void _mua(){
    _addCart();
    Navigator.push(context, MaterialPageRoute(builder: (context) => CartScreen()));
  }

  void _them(BuildContext context){
    _addCart();
    showDialog(
      context: context,
      builder: (ctx){
        return AlertDialog(
          title: Text('Thêm vào giỏ'),
          content: Text('Đã thêm vào giỏ'),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK')
            ),
          ]
        );
      }
    );
  }

  Widget _UserComment({ten, cmt, star}){
    return Container(
      padding: EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Container(
              height: MediaQuery.of(context).size.height * 0.07,
              child: Image.asset(
                  "assets/data/user.png")),
          SizedBox(
            width: 10,
          ),
          Flexible(
            child: Column(
              crossAxisAlignment:
              CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(ten),
                    RateStart(rate: double.parse(star.toString()), showText: false)
                  ],
                ),
                Text(cmt)
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _Body(){
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            child: Image(
              image: NetworkImage(widget.model.image),
              fit: BoxFit.fitWidth,
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.model.ten,
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold)),
                SizedBox(height: 20,),
                RateStart(rate: 4.5, size: 24),
                SizedBox(height: 20,),
                Text(
                    toMoney(widget.model.gia),
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 28,
                        fontWeight: FontWeight.bold)
                ),
                SizedBox(height: 20,),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          width: size.width,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Colors.black)),
                          child: Column(
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  " Khuyến mãi",
                                  style: TextStyle(
                                      fontWeight:
                                      FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                    " Giảm giá 20% khi sử dụng ví điện tử"),
                                SizedBox(
                                  height: 5,
                                ),
                              ])),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                          width: size.width,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Colors.black)),
                          child: Column(
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  " Hình thức giao hàng",
                                  style: TextStyle(
                                      fontWeight:
                                      FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                    " Phí vận chuyển 10.000 VND"),
                                SizedBox(
                                  height: 5,
                                ),
                              ])),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                          width: size.width,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Colors.black)),
                          child: Column(
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  " Mô tả",
                                  style: TextStyle(
                                      fontWeight:
                                      FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                    " Đặc tính, thương hiệu, nhà sản xuất...  "),
                                SizedBox(
                                  height: 5,
                                ),
                              ])),
                      ],
                  )
                ),
                SizedBox(height: 20,),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Đánh giá và nhận xét',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      _UserComment(ten: 'Nặc danh', cmt: 'Dùng tốt, rất hài lòng', star: 4),
                      _UserComment(ten: 'Nặc danh', cmt: 'Giao hàng chậm', star: 2),
                      _UserComment(ten: 'Nặc danh', cmt: 'Rất tốt', star: 5),
                    ],
                  ),
                )

              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(0, 27, 75, 1),
        appBar: buildAppBar(context),
        body: Column(
          children: [
            Flexible(
              child: _Body(),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    child: Text('Mua Ngay'),
                    onPressed: (){
                      _mua();
                    },
                  ),
                  ElevatedButton(
                    child: Text('Thêm Vào Giỏ'),
                    onPressed: (){
                      _them(context);
                    },
                  )
                ],
              ),
            )
          ]
        )
    );
  }
}

AppBar buildAppBar(BuildContext context) {
  return AppBar(
    // backgroundColor: Color.fromRGBO(0, 27, 75, 1),
    leading: IconButton(
      icon: SvgPicture.asset(
        'assets/data/back.svg',
        color: Colors.white,
      ),
      onPressed: () => Navigator.pop(context),
    ),
    title: Text('Chi Tiết'),
    actions: <Widget>[
      IconButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => CartScreen()));
          },
          icon: SvgPicture.asset('assets/data/cart.svg', color: Colors.white))
    ],
    elevation: 0,
  );
}
