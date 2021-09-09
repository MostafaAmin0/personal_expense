import 'package:flutter/material.dart';
import 'package:personal_expense/models/transaction_list.dart';
import 'package:personal_expense/widget/trans_item.dart';

class MyHomePage extends StatelessWidget {
  final Expense expense = Expense();

  @override
  Widget build(BuildContext context) {
    String ? titleInput;
    String ? priceInput;

    return Scaffold(
      appBar: AppBar(
        title: Text('Personal Expense'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Card(
            color: Colors.blue,
            child: Container(
              child: Text('Chart !'),
              width: 100.0,
            ),
            elevation: 5.0,
          ),
          Card(
            elevation: 5.0,
            child: Container(
              margin: EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Title',
                    ),
                    onChanged: (title) {
                      titleInput = title;
                    },
                  ),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Amount',
                    ),
                    onChanged: (price) {
                      priceInput = price;
                    },
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10.0),
                    child: TextButton(
                      onPressed: () {
                        print(titleInput);
                        print(priceInput);
                      },
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.all(15.0),
                        backgroundColor: Colors.blue,
                        primary: Colors.white,
                      ),
                      child: Text('Add Transaction'),
                    ),
                  )
                ],
              ),
            ),
          ),
          Column(
            children: expense.transactionsList.map<Widget>((tx) {
              return TransItem(
                name: tx.name,
                date: tx.date,
                money: tx.money,
              );
            }).toList(),
          )
        ],
      ),
    );
  }
}
