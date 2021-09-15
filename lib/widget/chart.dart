import 'package:flutter/material.dart';
import 'package:personal_expense/models/transaction.dart';
import 'package:intl/intl.dart';
import '../models/chart_bar.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;

  const Chart(this.recentTransactions);

  List<ChartBar> get groupedTransactionValues {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(
        Duration(days: index),
      );

      double total = 0;
      for (var rt in recentTransactions) {
        if (rt.date.day == weekDay.day &&
            rt.date.month == weekDay.month &&
            rt.date.year == weekDay.year) {
          total += rt.money;
        }
      }

      return ChartBar(
        day: DateFormat.E().format(weekDay),
        money: total,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6.0,
      margin: EdgeInsets.all(20.0),
      child: Row(
        children: groupedTransactionValues.map((elemnt) {
          return Text('${elemnt.day} :${elemnt.money.toStringAsFixed(2)}');
        }).toList(),
      ),
    );
  }
}
