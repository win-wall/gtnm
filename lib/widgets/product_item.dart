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
      child: Card(
        // padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        // decoration: BoxDecoration(
        //   color: Colors.white,
        //   borderRadius: BorderRadius.only(
        //       topLeft: Radius.circular(20),
        //       topRight: Radius.circular(20),
        //       bottomLeft: Radius.circular(20),
        //       bottomRight: Radius.circular(20))),
        child: Container(
          padding: EdgeInsets.all(10),
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
                Flexible(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        model.ten,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        toMoney( model.gia.toDouble()),
                        style: TextStyle(
                            color: Colors.black,
                            fontSize:
                                MediaQuery.of(context).size.height * 0.02,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      // Container(
                      //   alignment: Alignment(1, -1),
                      //   child: Container(
                      //       width: MediaQuery.of(context).size.width * 0.4,
                      //       child: Text(
                      //         "C??n h??ng",
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
                      RateStart(rate: 4.5,),
                      SizedBox(
                        height: 10,
                      ),
                      Text("13 l?????t ????nh gi??",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize:
                                MediaQuery.of(context).size.height *
                                    0.018,
                            fontWeight: FontWeight.w200))
                    ],
                  ),
                )
              ],
            ),
        )
        ),
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DetailScreen(model: model)));
      },
    );
  }
}
