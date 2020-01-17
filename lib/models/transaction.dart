import 'dart:collection';

import 'package:flutter/foundation.dart';

class Tx {
  Tx({
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

class TxModel extends ChangeNotifier {
  final List<Tx> _txs = [];

  UnmodifiableListView<Tx> get txs => UnmodifiableListView(_txs);

  UnmodifiableListView<Tx> get recentTxs => UnmodifiableListView(_txs.where((tx) => tx.date.isAfter(_lastWeek)));

  static get _lastWeek => DateTime.now().subtract(Duration(days: 7));

  void addTx(String title, double amount) {
    final newTx = Tx(
      id: DateTime.now().toString(),
      title: title,
      amount: amount,
      date: DateTime.now(),
    );
    _txs.add(newTx);

    notifyListeners();
  }
}
