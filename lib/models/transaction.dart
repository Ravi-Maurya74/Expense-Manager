import 'package:flutter/material.dart';

class Transaction {
  final DateTime id;
  final String title;
  final double amount;
  DateTime? date;
  Transaction(
      {required this.id,
      required this.title,
      required this.amount,
      this.date}) {
    date = date ?? DateTime.now();
  }
}
