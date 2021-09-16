import 'package:flutter/material.dart';
import 'package:personal_expense/widget/expense_list.dart';
import 'package:personal_expense/widget/new_transaction.dart';
import 'models/transaction_list.dart';
import 'widget/chart.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TransactionList transactions = TransactionList();

  void addNewTx(String title, double price , DateTime date) {
    setState(() {
      transactions.addTransaction(title, price,date);
    });
  }

  void _showTransactionSheet(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return NewTransaction(addNewTx);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Personal Expense'),
        actions: [
          TextButton(
            onPressed: () {
              _showTransactionSheet(context);
            },
            child: Icon(
              Icons.add_box,
              color: Colors.white,
              size: 20.0,
            ),
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Chart(transactions.recentWeek),
          ExpenseList(transactions),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showTransactionSheet(context);
        },
        child: Icon(
          Icons.add,
          size: 30.0,
        ),
      ),
    );
  }
}
