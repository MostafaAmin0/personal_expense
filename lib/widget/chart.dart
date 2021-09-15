import 'package:flutter/material.dart';
import 'package:personal_expense/models/transaction.dart';
import 'package:intl/intl.dart';
import 'package:personal_expense/widget/bar.dart';
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

  double get maxSpend {
    return groupedTransactionValues.fold(
        0.0, (sum, element) => element.money + sum);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6.0,
      margin: EdgeInsets.all(20.0),
      child: Padding(
        padding: EdgeInsets.all(20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: groupedTransactionValues.map((elemnt) {
            return Flexible(
              fit: FlexFit.tight,
              child: Bar(
                elemnt.day,
                elemnt.money,
                maxSpend == 0 ? 0 : (elemnt.money / maxSpend),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
