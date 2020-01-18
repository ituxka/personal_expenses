import 'package:flutter/material.dart';
import 'package:personal_expenses/widgets/transactions/new_transaction.dart';
import 'package:personal_expenses/widgets/transactions/user_transactions.dart';

class MyHomePage extends StatelessWidget {
  void _showNewTxArea(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (_) {
        return SingleChildScrollView(
            child: Container(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: NewTx(),
        ));
      },
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
            onPressed: () => _showNewTxArea(context),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _showNewTxArea(context),
      ),
      body: UserTxs(),
    );
  }
}
