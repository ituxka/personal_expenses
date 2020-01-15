import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:personal_expenses/models/transaction.dart';

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

class TransactionWidget extends StatelessWidget {
  const TransactionWidget({
    Key key,
    @required this.tx,
  }) : super(key: key);

  final Transaction tx;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: <Widget>[
          Container(
            margin: EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 50,
            ),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.purple,
                width: 2,
              ),
            ),
            child: Text(
              '\$${tx.amount}',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.purple,
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                tx.title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                formatDate(tx.date, [yyyy, '-', MM, '-', dd]),
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
