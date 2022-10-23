// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:expense_manager/models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  TransactionList(
      {required this.userTransactions, required this.deleteTx, super.key});
  final List<Transaction> userTransactions;
  final Function deleteTx;
  @override
  Widget build(BuildContext context) {
    return userTransactions.isEmpty
        ? Column(
            children: [
              Text('No transactions added yet!'),
              Container(
                  height: 200,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.contain,
                  )),
            ],
          )
        : Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
              child: ListView.builder(
                // scrollDirection: Axis.vertical,
                // shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Card(
                    margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                    elevation: 6,
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: 30,
                        child: Padding(
                          padding: EdgeInsets.all(6),
                          child: FittedBox(
                              child: Text(
                            '₹${userTransactions[index].amount.toStringAsFixed(0)}',
                          )),
                        ),
                      ),
                      title: Text(
                        userTransactions[index].title,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      subtitle: Text(
                        DateFormat.yMMMMd('en_US')
                            .format(userTransactions[index].date!),
                        style: TextStyle(color: Colors.grey),
                      ),
                      trailing: IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          deleteTx(userTransactions[index].id);
                        },
                      ),
                    ),
                    // child: Row(
                    //   children: [
                    //     Container(
                    //       margin:
                    //           EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                    //       padding: EdgeInsets.all(10),
                    //       decoration: BoxDecoration(
                    //           border: Border.all(
                    //               color: Theme.of(context).primaryColor,
                    //               width: 2)),
                    //       child: Text(
                    //         '\$${userTransactions[index].amount.toStringAsFixed(2)}',
                    //         style: TextStyle(
                    //             fontWeight: FontWeight.bold,
                    //             fontSize: 20,
                    //             color: Theme.of(context).primaryColor),
                    //       ),
                    //     ),
                    //     Column(
                    //       crossAxisAlignment: CrossAxisAlignment.start,
                    //       children: [
                    //         Text(
                    //           userTransactions[index].title,
                    //           style: TextStyle(
                    //               fontWeight: FontWeight.bold, fontSize: 16),
                    //         ),
                    //         Text(
                    //           DateFormat.yMMMMd('en_US')
                    //               .format(userTransactions[index].date!),
                    //           style: TextStyle(color: Colors.grey),
                    //         ),
                    //       ],
                    //     )
                    //   ],
                    // ),
                  );
                },
                itemCount: userTransactions.length,
              ),
            ),
          );
  }
}
