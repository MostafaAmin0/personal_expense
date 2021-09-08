import 'package:flutter/material.dart';
import 'package:personal_expense/models/transaction_list.dart';
import 'package:personal_expense/widget/trans_item.dart';

class MyHomePage extends StatelessWidget {
  final Expense expense = Expense();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Personal Expense'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Card(
            color: Colors.blue,
            child: Container(
              child: Text('Chart !'),
              width: 100.0,
            ),
            elevation: 5.0,
          ),
          Column(
            children: expense.transactionsList.map<Widget>((tx) {
              return TransItem(
                name: tx.name,
                date: tx.date,
                money: tx.money,
              );
            }).toList(),
          )
        ],
      ),
    );
  }
}
