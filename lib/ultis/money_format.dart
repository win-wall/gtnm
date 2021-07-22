// ignore: import_of_legacy_library_into_null_safe
import 'package:intl/intl.dart';

String toMoney(number){
  //  (amount: number).output.withoutFractionDigits + 'đ';
  var format = NumberFormat.currency(decimalDigits: 0, symbol: '');
  return format.format(number) + 'đ';
}