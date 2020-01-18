import 'package:flutter/material.dart';
import 'package:personal_expenses/widgets/chart/chart.dart';
import 'package:personal_expenses/widgets/transactions/transaction_list.dart';

class UserTxs extends StatefulWidget {
  @override
  _UserTxsState createState() => _UserTxsState();
}

class _UserTxsState extends State<UserTxs> {
  bool _showChart = false;

  void _onToggleChart(bool value) {
    setState(() => _showChart = value);
  }

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    final isLandscape = orientation == Orientation.landscape;

    return Column(
      children: <Widget>[
        if (isLandscape)
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Show chart'),
              Switch.adaptive(
                onChanged: _onToggleChart,
                value: _showChart,
              ),
            ],
          ),
        if (_showChart || !isLandscape) Expanded(child: Chart()),
        if (!_showChart || !isLandscape) Expanded(child: TxList()),
      ],
    );
  }
}
