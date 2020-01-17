import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:personal_expenses/models/transaction.dart';
import 'package:provider/provider.dart';

class TxWidget extends StatelessWidget {
  const TxWidget({
    Key key,
    @required this.tx,
  }) : super(key: key);

  final Tx tx;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: ListTile(
        leading: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            border: Border.all(
              color: Theme.of(context).primaryColor,
              width: 2,
            ),
          ),
          child: Text(
            '\$${tx.amount.toStringAsFixed(2)}',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).primaryColor,
            ),
          ),
        ),
        title: Text(tx.title),
        subtitle: Text(
          formatDate(tx.date, [yyyy, '-', MM, '-', dd]),
          style: TextStyle(color: Colors.grey),
        ),
        trailing: Consumer<TxModel>(
          builder: (_, txModel, __) => IconButton(
            color: Colors.red,
            onPressed: () => txModel.deleteTx(tx.id),
            icon: Icon(Icons.delete),
          ),
        ),
      ),
    );
  }
}
