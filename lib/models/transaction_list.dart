import 'package:personal_expense/models/transaction.dart';

class Expense {
  List<Transaction> _transactionsList = [
    Transaction(
      id: '1',
      name: 'Shoes',
      date: DateTime.now(),
      money: 150,
    ),
    Transaction(
      id: '2',
      name: 'Mango',
      date: DateTime.now(),
      money: 120,
    ),
  ];

  get transactionsList => _transactionsList;
}
