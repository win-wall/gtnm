import 'package:flutter/material.dart';
import 'package:gtnm/models/product_model.dart';
import 'package:gtnm/widgets/product_item.dart';
import 'package:gtnm/widgets/sale_banner.dart';
import 'package:gtnm/widgets/search_bar.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>{
  @override
  void initState() {
    super.initState();
  }

  // ignore: non_constant_identifier_names
  Widget _ItemList(){
    return GridView.builder(  
      itemCount: m_products.length,  
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(  
          childAspectRatio: 3/4,
          crossAxisCount: 2,
          crossAxisSpacing: 5.0,  
          mainAxisSpacing: 5.0  
      ),  
      itemBuilder: (BuildContext context, int index){  
        return ProductItem(model: m_products[index],); 
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(10),
        child: _ItemList()
      ),
    );
  }
}
