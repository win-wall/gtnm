// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_money_formatter/flutter_money_formatter.dart';

String toMoney(number){
  return FlutterMoneyFormatter(amount: number).output.withoutFractionDigits + 'đ';
}