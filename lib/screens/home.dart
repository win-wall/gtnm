import 'package:flutter/material.dart';
import 'package:gtnm/models/product_model.dart';
import 'package:gtnm/ultis/global.dart';
import 'package:gtnm/ultis/loadJson.dart';
import 'package:gtnm/widgets/product_item.dart';
import 'package:gtnm/widgets/sale_banner.dart';
import 'package:gtnm/widgets/search_bar.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  Future<List<ProductModel>> _loadProduct() async {
    // return await loadProductData();
    return m_products;
  }

  // ignore: non_constant_identifier_names
  Widget _ItemList(List<ProductModel> products) {
    return Container(
        child: ListView.builder(
      shrinkWrap: true,
      physics: ScrollPhysics(),
      itemCount: products.length,
      // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      //     childAspectRatio: 1.8,
      //     crossAxisCount: 1,
      //     crossAxisSpacing: 5.0,
      //     mainAxisSpacing: 5.0),
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.only(top: 10),
          child: ProductItem(
            model: products[index],
          ),
        );
      },
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
            future: _loadProduct(),
            builder: (context, AsyncSnapshot<List<ProductModel>> snapshot) {
              if (!snapshot.hasData)
                return Center(
                  child: CircularProgressIndicator(),
                );
              return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: ListView(children: [
                    // SaleBanner(),
                    // SizedBox(height: 10),
                    _ItemList(snapshot.data!),
                  ]));
            }));
  }
}
