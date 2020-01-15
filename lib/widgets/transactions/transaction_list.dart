import 'package:flutter/material.dart';
import 'package:personal_expenses/models/transaction.dart';
import 'package:personal_expenses/widgets/transactions/transaction.dart';

class TransactionList extends StatelessWidget {
  TransactionList(this.transactions);

  final List<Transaction> transactions;

  Widget _itemBuilder(BuildContext ctx, int index) {
    return TransactionWidget(
      tx: transactions[index],
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: transactions.length,
      itemBuilder: _itemBuilder,
    );
  }
}
