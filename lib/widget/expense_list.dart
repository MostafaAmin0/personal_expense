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
      child: ListView.builder(
        padding:EdgeInsets.all(10.0),
        itemCount: transactions.list.length,
        itemBuilder: (ctx , index) {
          return TransItem(
            name: transactions.list[index].name,
            date: transactions.list[index].date,
            money: transactions.list[index].money,
          );
        },
      ),
    );
  }
}
