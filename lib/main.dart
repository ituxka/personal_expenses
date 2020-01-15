import 'package:flutter/material.dart';
import 'package:personal_expenses/widgets/chart/chart.dart';
import 'package:personal_expenses/widgets/transactions/user_transactions.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Personal Expenses'),
      ),
      body: Column(
        children: <Widget>[
          Chart(),
          UserTransactions(),
        ],
      ),
    );
  }
}
