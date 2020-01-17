import 'package:flutter/material.dart';
import 'package:personal_expenses/models/transaction.dart';
import 'package:personal_expenses/widgets/transactions/transaction.dart';
import 'package:provider/provider.dart';

class TxList extends StatelessWidget {
  Widget _itemBuilder(List<Tx> txs, int index) {
    return TxWidget(
      tx: txs[index],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<TxModel>(
      builder: (_, txModel, __) {
        final List<Tx> txs = txModel.txs;

        return txs.isEmpty
            ? noTxs
            : ListView.builder(
                itemCount: txs.length,
                itemBuilder: (_, int index) => _itemBuilder(txs, index),
              );
      },
    );
  }
}

final Widget noTxs = Column(
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
