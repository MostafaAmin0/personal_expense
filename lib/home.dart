import 'package:flutter/material.dart';
import 'package:personal_expense/widget/user_transaction.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
          UserTransaction(),
        ],
      ),
    );
  }
}
