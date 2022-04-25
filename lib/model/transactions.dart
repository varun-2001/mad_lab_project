import 'package:flutter/foundation.dart';

class Transaction {
  String? id;
  String? title;
  double? amount;
  DateTime? date;
  bool isExpense=true;
  String? category;

  Transaction({
    @required this.id,
    @required this.amount,
    @required this.date,
    @required this.title,
    required this.isExpense,
    @required this.category,
  });
}
