import 'package:flutter/material.dart';
import 'package:personal_expenses/models/transaction.dart';

class NewTransaction extends StatefulWidget {
  NewTransaction(this.addTransaction);

  final NewTransactionCb addTransaction;

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final amountController = TextEditingController();
  final titleController = TextEditingController();

  void _submitData() {
    var text = titleController.text;
    var amount = double.tryParse(amountController.text) ?? 0;

    if (text.isEmpty || amount <= 0) {
      return;
    }

    widget.addTransaction(
      text,
      amount,
    );

    Navigator.of(context).pop();
  }

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
              onSubmitted: (_) => _submitData(),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: amountController,
              onSubmitted: (_) => _submitData(),
              keyboardType: TextInputType.numberWithOptions(decimal: true),
            ),
            FlatButton(
              textColor: Colors.purple,
              onPressed: () => _submitData(),
              child: Text('Add Transaction'),
            )
          ],
        ),
      ),
    );
  }
}
