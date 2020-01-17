import 'package:flutter/material.dart';
import 'package:personal_expenses/models/transaction.dart';
import 'package:personal_expenses/widgets/home_screen.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => TxModel()),
      ],
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.purple,
          fontFamily: 'JetBrainsMono',
        ),
        home: MyHomePage(),
      ),
    );
  }
}
