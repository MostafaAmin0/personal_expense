import 'package:flutter/material.dart';
import 'package:personal_expense/models/transaction_list.dart';
import 'package:personal_expense/widget/trans_item.dart';

class ExpenseList extends StatelessWidget {
  const ExpenseList(this.transactions);

  final TransactionList transactions;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300.0,
      child: SingleChildScrollView(
        child: Column(
          children: transactions.list.map<Widget>((tx) {
            return TransItem(
              name: tx.name,
              date: tx.date,
              money: tx.money,
            );
          }).toList(),
        ),
      ),
    );
  }
}