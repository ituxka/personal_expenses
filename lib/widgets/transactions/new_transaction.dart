import 'package:flutter/material.dart';
import 'package:personal_expenses/models/transaction.dart';
import 'package:provider/provider.dart';

class NewTransaction extends StatefulWidget {
  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final amountController = TextEditingController();
  final titleController = TextEditingController();

  void _submitData(BuildContext ctx) {
    var text = titleController.text;
    var amount = double.tryParse(amountController.text) ?? 0;

    if (text.isEmpty || amount <= 0) {
      return;
    }

    Provider.of<TransactionModel>(ctx, listen: false).addTx(text, amount);

    Navigator.of(ctx).pop();
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
              onSubmitted: (_) => _submitData(context),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: amountController,
              onSubmitted: (_) => _submitData(context),
              keyboardType: TextInputType.numberWithOptions(decimal: true),
            ),
            FlatButton(
              textColor: Colors.purple,
              onPressed: () => _submitData(context),
              child: Text('Add Transaction'),
            )
          ],
        ),
      ),
    );
  }
}
