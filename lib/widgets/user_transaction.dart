// // ignore_for_file: prefer_const_constructors

// import 'package:expense_manager/widgets/new_transaction.dart';
// import 'package:expense_manager/widgets/transaction_list.dart';
// import 'package:flutter/material.dart';
// import 'package:expense_manager/models/transaction.dart';

// class UserTransaction extends StatefulWidget {
//   const UserTransaction({super.key});

//   @override
//   State<UserTransaction> createState() => _UserTransactionState();
// }

// class _UserTransactionState extends State<UserTransaction> {
//   final _userTransactions = <Transaction>[
//     Transaction(id: 't1', title: 'New Shoes', amount: 69.99),
//     Transaction(id: 't2', title: 'Weekly Groceries', amount: 16.53),
//   ];
//   void _addNewTransaction(String title, String amount) {
//     final newTx = Transaction(
//         id: DateTime.now.toString(),
//         title: title,
//         amount: double.parse(amount));
//     setState(() {
//       _userTransactions.add(newTx);
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         NewTransaction(addTx: _addNewTransaction),
//         TransactionList(userTransactions: _userTransactions),
//       ],
//     );
//   }
// }
