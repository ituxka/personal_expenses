import 'package:flutter/material.dart';
import 'package:personal_expenses/models/transaction.dart';
import 'package:provider/provider.dart';

class NewTx extends StatefulWidget {
  @override
  _NewTxState createState() => _NewTxState();
}

class _NewTxState extends State<NewTx> {
  final amountController = TextEditingController();
  final titleController = TextEditingController();

  void _submitData(BuildContext context) {
    var text = titleController.text;
    var amount = double.tryParse(amountController.text) ?? 0;

    if (text.isEmpty || amount <= 0) {
      return;
    }

    Provider.of<TxModel>(context, listen: false).addTx(text, amount);

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
