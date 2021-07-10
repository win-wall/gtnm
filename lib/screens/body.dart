import 'package:flutter/material.dart';

import 'package:gtnm/models/product_model.dart';

class Body extends StatefulWidget {
  Body({required this.model});
  ProductModel model;

  @override
  _BodyState createState() => _BodyState(this.model);
}

class _BodyState extends State<Body> {
  ProductModel model;
  _BodyState(this.model);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Stack(
        children: [
          Column(
            children: <Widget>[
              Container(
                  alignment: Alignment(1, 0.8),
                  child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(model.ten,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w100)),
                          Text(model.category,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              RichText(
                                  text: TextSpan(children: [
                                TextSpan(text: "Giá: \n"),
                                TextSpan(
                                    text: "${model.gia} VND",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 28,
                                        fontWeight: FontWeight.bold))
                              ])),
                              SizedBox(
                                width: 20,
                              ),
                              Expanded(
                                  child: Image(
                                      image: NetworkImage(model.image),
                                      fit: BoxFit.fitWidth))
                            ],
                          )
                        ],
                      ))),
              SizedBox(
                  height: size.height,
                  child: Stack(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: size.height * 0),
                        padding: EdgeInsets.only(
                            top: size.height * 0.04, left: 20, right: 20),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(24),
                                topRight: Radius.circular(24))),
                        child: Column(
                          children: [
                            Container(
                                alignment: Alignment(-1, -1),
                                width: size.width,
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
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Text(
                                      'Đánh giá và nhận xét',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                            height: size.height * 0.07,
                                            child: Image.asset(
                                                "assets/data/user.png")),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text("Khánh hàng 1"),
                                            Text("Dùng tốt rất hài lòng")
                                          ],
                                        )
                                      ],
                                    ),
                                  ],
                                ))
                          ],
                        ),
                      ),
                    ],
                  )),
            ],
          ),
        ],
      ),
    );
  }
}
