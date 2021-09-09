import 'package:flutter/material.dart';
import 'package:personal_expense/models/transaction.dart';
import 'package:personal_expense/models/transaction_list.dart';

import 'expense_list.dart';
import 'new_transaction.dart';

class UserTransaction extends StatefulWidget {
  @override
  _UserTransactionState createState() => _UserTransactionState();
}

class _UserTransactionState extends State<UserTransaction> {
  final TransactionList transactions = TransactionList();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NewTransaction(),
        ExpenseList(transactions),
      ],
    );
  }
}
