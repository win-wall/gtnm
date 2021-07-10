import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:gtnm/models/product_model.dart';
import 'package:gtnm/screens/detail.dart';

class ProductItem extends StatelessWidget {
  ProductItem({required this.model});
  ProductModel model;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Expanded(
            child: InkWell(
      child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20))),
          child: Column(
            children: [
              SizedBox(
                height: 25,
              ),
              Row(
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black)),
                        width: MediaQuery.of(context).size.width * 0.3,
                        height: MediaQuery.of(context).size.width * 0.4,
                        child: Image(
                            image: NetworkImage(model.image),
                            fit: BoxFit.fitWidth),
                      )
                    ],
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
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
                                  fontSize: MediaQuery.of(context).size.height *
                                      0.02),
                            )),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      Container(
                        alignment: Alignment(1, -1),
                        child: Container(
                            width: MediaQuery.of(context).size.width * 0.4,
                            child: Text(
                              model.gia.toString(),
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize:
                                      MediaQuery.of(context).size.height * 0.02,
                                  fontWeight: FontWeight.bold),
                            )),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      Container(
                        alignment: Alignment(1, -1),
                        child: Container(
                            width: MediaQuery.of(context).size.width * 0.4,
                            child: Text(
                              "Còn hàng",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: MediaQuery.of(context).size.height *
                                      0.015,
                                  fontWeight: FontWeight.w100),
                            )),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      Container(
                          alignment: Alignment(1, -1),
                          child: Container(
                              width: MediaQuery.of(context).size.width * 0.4,
                              height: MediaQuery.of(context).size.height * 0.02,
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                    size: MediaQuery.of(context).size.height *
                                        0.02,
                                  ),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.01,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                    size: MediaQuery.of(context).size.height *
                                        0.02,
                                  ),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.01,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                    size: MediaQuery.of(context).size.height *
                                        0.02,
                                  ),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.01,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                    size: MediaQuery.of(context).size.height *
                                        0.02,
                                  ),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.01,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: Colors.grey,
                                    size: MediaQuery.of(context).size.height *
                                        0.02,
                                  ),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.02,
                                  ),
                                  Text("4/5.0",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.015,
                                          fontWeight: FontWeight.w100))
                                ],
                              ))),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
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
                                      fontWeight: FontWeight.w100))))
                    ],
                  )
                ],
              )
            ],
          )),
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DetailScreen(model1: model)));
      },
    )));
    /* child: InkWell(
          child: Column(
            children: [
              Image(
                image: NetworkImage(model.image),
              ),
              Text(model.ten),
              Text(model.gia.toString()),
            ],
          ),
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => DetailScreen()));
          },
        )); */
  }
}
