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
      builder: (context, transaction, _) {
        final List<Transaction> transactions = transaction.transactions;

        return transactions.isEmpty
            ? noTransactions
            : ListView.builder(
                itemCount: transactions.length,
                itemBuilder: (BuildContext _, int index) => _itemBuilder(transactions, index),
              );
      },
    );
  }
}

final Widget noTransactions = Column(
  children: <Widget>[
    Text('No transactions added yet!'),
    Container(
      margin: EdgeInsets.only(top: 20),
      height: 200,
      child: Image.asset(
        'assets/images/waiting.png',
        fit: BoxFit.cover,
      ),
    ),
  ],
);
