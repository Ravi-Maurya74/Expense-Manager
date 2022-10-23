// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'package:expense_manager/widgets/chart.dart';
import 'package:expense_manager/widgets/new_transaction.dart';
import 'package:flutter/material.dart';
import 'models/transaction.dart';
import 'widgets/transaction_list.dart';
import 'package:intl/intl.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
      theme: ThemeData(
        primarySwatch: Colors.teal,
        fontFamily: 'Quicksand',
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _userTransactions = <Transaction>[
    // Transaction(id: 't1', title: 'New Shoes', amount: 69.99),
    // Transaction(id: 't2', title: 'Weekly Groceries', amount: 16.53),
  ];

  List<Transaction> get _recentTransactions {
    return _userTransactions.where((element) {
      return element.date!.isAfter(DateTime.now().subtract(Duration(days: 7)));
    }).toList();
  }

  void _addNewTransaction(String title, String amount, DateTime date) {
    final newTx = Transaction(
        id: DateTime.now(),
        title: title,
        amount: double.parse(amount),
        date: date);
    print('hello');
    print(newTx.id);
    setState(() {
      _userTransactions.add(newTx);
    });
  }

  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: ctx,
      builder: (context) {
        return NewTransaction(addTx: _addNewTransaction);
      },
    );
  }

  void _deleteTransaction(DateTime id) {
    setState(() {
      _userTransactions.removeWhere((element) => element.id == id);
    });
    print(id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('Expense Manager'),
        actions: [
          IconButton(
              onPressed: () {
                _startAddNewTransaction(context);
              },
              icon: Icon(Icons.add))
        ],
      ),
      body: Column(children: [
        Chart(_recentTransactions),
        TransactionList(
          userTransactions: _userTransactions,
          deleteTx: _deleteTransaction,
        )
      ]),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            _startAddNewTransaction(context);
          },
          child: Icon(Icons.add)),
    );
  }
}
