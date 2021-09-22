import 'package:flutter/material.dart';
import 'package:personal_expense/models/transaction_list.dart';
import 'package:personal_expense/widget/trans_item.dart';

class ExpenseList extends StatelessWidget {
  const ExpenseList(this.transactions, this.deleteTrans);

  final TransactionList transactions;
  final Function deleteTrans;

  @override
  Widget build(BuildContext context) {
    if (transactions.list.isEmpty) {
      return LayoutBuilder(
            builder: (ctx, constraints) {
              return Column(
                children: [
                  Text('No Transactions added yet !'),
                  SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    child: Image.asset(
                      'assets/image/waiting.png',
                      fit: BoxFit.cover,
                    ),
                    height: constraints.maxHeight * 0.6,
                  ),
                ],
              );
            },
          );
    } else {
      return ListView(
            padding: EdgeInsets.all(10.0),
            children: transactions.list.map<Widget>(
              (tx) => TransItem(
                key: ValueKey(tx.id),
                tx: tx,
                deleteTrans: deleteTrans,
              ),
            ).toList(),
          );
    }

    // ListView.builder(
    //     padding: EdgeInsets.all(10.0),
    //     itemCount: transactions.list.length,
    //     itemBuilder: (ctx, index) {
    //       return TransItem(
    //         key: ValueKey( transactions.list[index].id),
    //         tx: transactions.list[index],
    //         deleteTrans: deleteTrans,
    //       );
    //     },
    //   );
  }
}
