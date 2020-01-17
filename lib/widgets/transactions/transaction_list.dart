import 'package:flutter/material.dart';
import 'package:personal_expenses/models/transaction.dart';
import 'package:personal_expenses/widgets/transactions/transaction.dart';
import 'package:provider/provider.dart';

class TransactionList extends StatelessWidget {
  Widget _itemBuilder(List<Transaction> transactions, int index) {
    return TransactionWidget(
      tx: transactions[index],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<TransactionModel>(
      builder: (context, transaction, _) => ListView.builder(
        itemCount: transaction.transactions.length,
        itemBuilder: (BuildContext _, int index) => _itemBuilder(transaction.transactions, index),
      ),
    );
  }
}
