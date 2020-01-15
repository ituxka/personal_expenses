import 'package:flutter/material.dart';
import 'package:personal_expenses/widgets/transactions/user_transactions.dart';

class NewTransaction extends StatelessWidget {
  NewTransaction(this.addTransaction);

  final NewTransactionCb addTransaction;
  final amountController = TextEditingController();
  final titleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              controller: titleController,
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: amountController,
            ),
            FlatButton(
              textColor: Colors.purple,
              onPressed: () => addTransaction(
                titleController.text,
                double.tryParse(amountController.text) ?? 0,
              ),
              child: Text('Add Transaction'),
            )
          ],
        ),
      ),
    );
  }
}
