import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

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
      isScrollControlled: true,
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

  List<Widget> _buildlandscape(double availableHeight, Widget exListWidget) {
    return [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Show Chart',
            style: Theme.of(context).textTheme.headline6,
          ),
          Switch.adaptive(
            activeColor: Theme.of(context).accentColor,
            value: _showChart,
            onChanged: (value) {
              setState(() {
                _showChart = value;
              });
            },
          ),
        ],
      ),
      _showChart
          ? Container(
              height: availableHeight * 0.7,
              child: Chart(transactions.recentWeek),
            )
          : exListWidget,
    ];
  }

  List<Widget> _buildPortrait(double availableHeight, Widget exListWidget) {
    return [
      Container(
        height: availableHeight * 0.3,
        child: Chart(transactions.recentWeek),
      ),
      exListWidget,
    ];
  }

  CupertinoNavigationBar _buildCupertinoNavigationBar(BuildContext context) {
    return CupertinoNavigationBar(
      middle: Text('Personal Expense'),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          CupertinoButton(
            child: Icon(
              CupertinoIcons.add,
              color: Colors.white,
            ),
            onPressed: () {
              _showTransactionSheet(context);
            },
          ),
        ],
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
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
  }

  @override
  Widget build(BuildContext context) {
    final PreferredSizeWidget appBar = Platform.isIOS
        ? _buildCupertinoNavigationBar(context)
        : _buildAppBar(context) as PreferredSizeWidget;

    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    final double availableHeight = MediaQuery.of(context).size.height -
        appBar.preferredSize.height -
        MediaQuery.of(context).padding.top;

    final exListWidget = Container(
      height: availableHeight * 0.7,
      child: ExpenseList(transactions, deleteTransaction),
    );

    final pageBody = SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (isLandscape) ..._buildlandscape(availableHeight, exListWidget),
            if (!isLandscape) ..._buildPortrait(availableHeight, exListWidget),
          ],
        ),
      ),
    );
    return Platform.isIOS
        ? CupertinoPageScaffold(
            child: pageBody,
            navigationBar: appBar as ObstructingPreferredSizeWidget,
          )
        : Scaffold(
            appBar: appBar,
            body: pageBody,
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
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
