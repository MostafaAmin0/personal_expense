import 'package:personal_expense/models/transaction.dart';

class TransactionList {
  List<Transaction> _transactionsList = [
    // Transaction(
    //   id: '1',
    //   name: 'Shoes',
    //   date: DateTime.now(),
    //   money: 150,
    // ),
    // Transaction(
    //   id: '2',
    //   name: 'Mango',
    //   date: DateTime.now(),
    //   money: 120,
    // ),
  ];

  get list => _transactionsList;

  get recentWeek {
    return _transactionsList.where((element) {
      return element.date.isAfter(DateTime.now().subtract(Duration(days: 7)));
    }).toList();
  }

  void addTransaction(String name, double money) {
    final newTx = Transaction(
      id: DateTime.now().toString(),
      name: name,
      money: money,
      date: DateTime.now(),
    );

    _transactionsList.add(newTx);
  }
}
