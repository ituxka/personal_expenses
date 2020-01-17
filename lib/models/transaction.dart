import 'dart:collection';

import 'package:flutter/foundation.dart';

class Transaction {
  Transaction({
    @required this.id,
    @required this.title,
    @required this.amount,
    @required this.date,
  });

  final double amount;
  final DateTime date;
  final String id;
  final String title;
}

class TransactionModel extends ChangeNotifier {
  final List<Transaction> _transactions = [
    Transaction(
      id: '1',
      title: 'New Shoes',
      amount: 69.99,
      date: DateTime.now(),
    ),
    Transaction(
      id: '2',
      title: 'Weekly Groceries',
      amount: 16.53,
      date: DateTime.now(),
    ),
  ];

  UnmodifiableListView<Transaction> get transactions => UnmodifiableListView(_transactions);

  void addTx(String title, double amount) {
    final newTx = Transaction(
      id: DateTime.now().toString(),
      title: title,
      amount: amount,
      date: DateTime.now(),
    );
    _transactions.add(newTx);

    notifyListeners();
  }
}
