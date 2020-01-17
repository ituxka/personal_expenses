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
  final List<Transaction> _transactions = [];

  UnmodifiableListView<Transaction> get transactions => UnmodifiableListView(_transactions);

  UnmodifiableListView<Transaction> get recentTransactions =>
      UnmodifiableListView(_transactions.where((tx) => tx.date.isAfter(_lastWeek)));

  static get _lastWeek => DateTime.now().subtract(Duration(days: 7));

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
