import 'package:flutter/material.dart';
import 'package:personal_expense/models/transaction_list.dart';
import 'package:personal_expense/widget/trans_item.dart';

class ExpenseList extends StatelessWidget {
  const ExpenseList({required this.expense});

  final Expense expense;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: expense.transactionsList.map<Widget>((tx) {
        return TransItem(
          name: tx.name,
          date: tx.date,
          money: tx.money,
        );
      }).toList(),
    );
  }
}