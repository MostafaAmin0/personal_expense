import 'package:flutter/material.dart';
import 'package:personal_expense/models/transaction_list.dart';

class MyHomePage extends StatelessWidget {
  final Expense expense = Expense();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Personal Expense'),
      ),
      body: Column(
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
              return Card(
                child: Text(tx.name.toString()),
              );
            }).toList(),
          )
        ],
      ),
    );
  }
}
