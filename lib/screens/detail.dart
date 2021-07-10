import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gtnm/models/product_model.dart';
import 'package:gtnm/screens/body.dart';
import 'package:gtnm/widgets/product_item.dart';

class DetailScreen extends StatefulWidget {
  DetailScreen({required this.model1});
  ProductModel model1;
  @override
  _DetailScreenState createState() => _DetailScreenState(this.model1);
}

class _DetailScreenState extends State<DetailScreen> {
  ProductModel model;
  _DetailScreenState(this.model);
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(0, 27, 75, 1),
        appBar: buildAppBar(context),
        bottomNavigationBar: new BottomNavigationBar(items: [
          new BottomNavigationBarItem(
            icon: new Icon(Icons.add),
            label: "Mua Ngay",
          ),
          new BottomNavigationBarItem(
            icon: new Icon(Icons.edit),
            label: "Thêm vào giỏ",
          ),
        ]),
        body: Body(model: model));
  }
}

AppBar buildAppBar(BuildContext context) {
  return AppBar(
    backgroundColor: Color.fromRGBO(0, 27, 75, 1),
    leading: IconButton(
      icon: SvgPicture.asset(
        'assets/data/back.svg',
        color: Colors.white,
      ),
      onPressed: () => Navigator.pop(context),
    ),
    actions: <Widget>[
      IconButton(
          onPressed: () {},
          icon: SvgPicture.asset('assets/data/cart.svg', color: Colors.white))
    ],
    elevation: 0,
  );
}
