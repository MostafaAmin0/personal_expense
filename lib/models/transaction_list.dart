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

  void addTransaction(String name, double money, DateTime date) {
    final newTx = Transaction(
      id: DateTime.now().toString(),
      name: name,
      money: money,
      date: date,
    );

    _transactionsList.add(newTx);
  }

  void deleteTransaction(String id) {
    _transactionsList.removeWhere((element) => id == element.id);
  }
}
