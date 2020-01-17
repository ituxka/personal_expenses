import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:personal_expenses/models/transaction.dart';
import 'package:personal_expenses/widgets/chart/chart_bar.dart';
import 'package:provider/provider.dart';

class TxValueForChart {
  TxValueForChart({this.day, this.amount});

  double amount;
  String day;
}

class Chart extends StatelessWidget {
  static List<TxValueForChart> groupedTxsValues(List<Tx> recentTx) {
    return List.generate(7, (int index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));

      double totalAmount = 0;
      for (var tx in recentTx) {
        if (_isTxInCurrentDay(tx, weekDay)) {
          totalAmount += tx.amount;
        }
      }

      return TxValueForChart(
        day: _firstLetterOfWeek(weekDay),
        amount: totalAmount,
      );
    }).reversed.toList();
  }

  static String _firstLetterOfWeek(DateTime weekDay) => formatDate(weekDay, [D])[0].toUpperCase();

  static bool _isTxInCurrentDay(Tx tx, DateTime targetDay) {
    if (tx.date.day == targetDay.day && tx.date.month == targetDay.month && tx.date.year == targetDay.year) {
      return true;
    }

    return false;
  }

  final Function maxSpending = (List<TxValueForChart> txValues) {
    return txValues.fold<double>(0.0, (sum, txValue) => sum + txValue.amount);
  };

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Consumer<TxModel>(
        builder: (_, txModel, __) {
          final groupedTxValues = groupedTxsValues(txModel.recentTxs);
          return Card(
            elevation: 5,
            margin: EdgeInsets.all(20),
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: chartBars(groupedTxValues, maxSpending(groupedTxValues)),
              ),
            ),
          );
        },
      ),
    );
  }
}

typedef List<Widget> CreateChartBars(List<TxValueForChart> groupedTxValues, double totalSpending);

final CreateChartBars chartBars = (List<TxValueForChart> groupedTxValues, double totalSpending) {
  return groupedTxValues.map((txValue) {
    final spendingPercentage = totalSpending == 0.0 ? 0.0 : txValue.amount / totalSpending;

    return Flexible(
      fit: FlexFit.tight,
      child: ChartBar(
        label: txValue.day,
        spendingAmount: txValue.amount,
        spendingPercentageOfTotal: spendingPercentage,
      ),
    );
  }).toList();
};
