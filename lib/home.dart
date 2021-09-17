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
  bool _showChart = true;

  void addNewTx(String title, double price, DateTime date) {
    setState(() {
      transactions.addTransaction(title, price, date);
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

  void deleteTransaction(String id) {
    print('object');
    setState(() {
      transactions.deleteTransaction(id);
    });
  }

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
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
    );

    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    final double availableHeight = MediaQuery.of(context).size.height -
        appBar.preferredSize.height -
        MediaQuery.of(context).padding.top;

    final exListWidget = Container(
      height: availableHeight * 0.7,
      child: ExpenseList(transactions, deleteTransaction),
    );

    return Scaffold(
      appBar: appBar,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (isLandscape)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Show Chart'),
                Switch(
                  value: _showChart,
                  onChanged: (value) {
                    setState(() {
                      _showChart = value;
                    });
                  },
                ),
              ],
            ),
          if (!isLandscape)
            Container(
              height: availableHeight * 0.3,
              child: Chart(transactions.recentWeek),
            ),
          if (!isLandscape) exListWidget,
          if (isLandscape)
            _showChart
                ? Container(
                    height: availableHeight * 0.7,
                    child: Chart(transactions.recentWeek),
                  )
                : exListWidget,
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
