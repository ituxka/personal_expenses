import 'package:flutter/material.dart';
import 'package:personal_expenses/widgets/transactions/new_transaction.dart';
import 'package:personal_expenses/widgets/transactions/user_transactions.dart';

class MyHomePage extends StatelessWidget {
  void _showNewTransactionArea(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) => NewTransaction(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Personal Expenses'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => _showNewTransactionArea(context),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _showNewTransactionArea(context),
      ),
      body: UserTransactions(),
    );
  }
}
