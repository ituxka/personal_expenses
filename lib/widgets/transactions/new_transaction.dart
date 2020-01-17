import 'package:date_format/date_format.dart';
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
  DateTime _selectedDate;

  void _submitData(BuildContext context) {
    var text = titleController.text;
    var amount = double.tryParse(amountController.text) ?? 0;

    if (text.isEmpty || amount <= 0 || _selectedDate == null) {
      return;
    }

    Provider.of<TxModel>(context, listen: false).addTx(text, amount, _selectedDate);

    Navigator.of(context).pop();
  }

  Future<void> _showDatePicker() async {
    final selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
    );

    setState(() {
      _selectedDate = selectedDate ?? DateTime.now();
    });
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
            Container(
              height: 70,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(_selectedDate != null ? formatDate(_selectedDate, [dd, '/', M, '/', yyyy]) : 'No date chosen!'),
                  FlatButton(
                    textColor: Theme.of(context).primaryColor,
                    onPressed: _showDatePicker,
                    child: Text(
                      'Choose date',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            RaisedButton(
              textColor: Colors.white,
              color: Theme.of(context).primaryColor,
              onPressed: () => _submitData(context),
              child: Text('Add Transaction'),
            )
          ],
        ),
      ),
    );
  }
}
