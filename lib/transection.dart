import 'package:flutter/foundation.dart';

class Transection {
  String id;
  String title;
  double amount;
  DateTime date;

  Transection({
    @required this.id,
    @required this.title,
    @required this.amount,
    @required this.date,
  });
}
