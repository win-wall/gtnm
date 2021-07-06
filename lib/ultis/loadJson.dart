import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:gtnm/models/product_model.dart';

Future<List<ProductModel>> loadProductData() async {
  List<ProductModel> out = [];
  var jsonText = await rootBundle.loadString('assets/data/product.json');
  List parsedList = json.decode(jsonText);
  out = parsedList.map((data) => ProductModel.fromJson(data)).toList();
  return out;
}

Future<List<ProductModel>> loadCartData() async {
  List<ProductModel> out = [];
  var jsonText = await rootBundle.loadString('assets/data/cart.json');
  List parsedList = json.decode(jsonText);
  out = parsedList.map((data) => ProductModel.fromJson(data)).toList();
  return out;
}