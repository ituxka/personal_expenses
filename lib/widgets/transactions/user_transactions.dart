import 'package:flutter/material.dart';
import 'package:personal_expenses/widgets/chart/chart.dart';
import 'package:personal_expenses/widgets/transactions/transaction_list.dart';

class UserTransactions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Chart(),
        Expanded(
          child: TransactionList(),
        ),
      ],
    );
  }
}
