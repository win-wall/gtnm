import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:gtnm/models/product_model.dart';
import 'package:gtnm/screens/detail.dart';
import 'package:gtnm/ultis/money_format.dart';
import 'package:gtnm/widgets/rate_start.dart';

class ProductItem extends StatelessWidget {
  ProductItem({required this.model});
  ProductModel model;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20))),
        child: Row(
            children: [
              Container(
                // decoration: BoxDecoration(
                //   border: Border.all(color: Colors.black)),
                width: MediaQuery.of(context).size.width * 0.3,
                height: MediaQuery.of(context).size.width * 0.3,
                child: Image(
                  image: NetworkImage(model.image),
                  fit: BoxFit.contain,),
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      alignment: Alignment(1, -1),
                      child: Container(
                          width: MediaQuery.of(context).size.width * 0.4,
                          child: Text(
                            model.ten,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16),
                          )),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      alignment: Alignment(1, -1),
                      child: Container(
                          width: MediaQuery.of(context).size.width * 0.4,
                          child: Text(
                            toMoney( model.gia.toDouble()),
                            style: TextStyle(
                                color: Colors.black,
                                fontSize:
                                    MediaQuery.of(context).size.height * 0.02,
                                fontWeight: FontWeight.bold),
                          )),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    // Container(
                    //   alignment: Alignment(1, -1),
                    //   child: Container(
                    //       width: MediaQuery.of(context).size.width * 0.4,
                    //       child: Text(
                    //         "Còn hàng",
                    //         style: TextStyle(
                    //             color: Colors.black,
                    //             fontSize: MediaQuery.of(context).size.height *
                    //                 0.015,
                    //             fontWeight: FontWeight.w100),
                    //       )),
                    // ),
                    // SizedBox(
                    //   height: 10,
                    // ),
                    Container(
                        alignment: Alignment(1, -1),
                        child: Container(
                            width: MediaQuery.of(context).size.width * 0.4,
                            height: MediaQuery.of(context).size.height * 0.02,
                            child: RateStart(rate: 4.5,))),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                        alignment: Alignment(1, -1),
                        child: Container(
                            width: MediaQuery.of(context).size.width * 0.4,
                            height: MediaQuery.of(context).size.height * 0.02,
                            child: Text("13 lượt đánh giá",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize:
                                        MediaQuery.of(context).size.height *
                                            0.018,
                                    fontWeight: FontWeight.w200))))
                  ],
                ),
              )
            ],
          )
        ),
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DetailScreen(model1: model)));
      },
    );
  }
}
