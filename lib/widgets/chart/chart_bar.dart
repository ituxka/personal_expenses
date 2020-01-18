import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  ChartBar({
    @required this.label,
    @required this.spendingAmount,
    @required this.spendingPercentageOfTotal,
  });

  final String label;
  final double spendingAmount;
  final double spendingPercentageOfTotal;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext _, BoxConstraints constraints) {
        return Column(
          children: <Widget>[
            Container(
              height: constraints.maxHeight * 0.2,
              child: FittedBox(
                child: Text(
                  '\$${spendingAmount.toStringAsFixed(1)}',
                  style: TextStyle(fontSize: 13),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 4),
              width: 10,
              height: constraints.maxHeight * 0.6,
              child: Stack(
                children: <Widget>[
                  barBase,
                  FractionallySizedBox(
                    heightFactor: spendingPercentageOfTotal,
                    child: barIndicator(context),
                  ),
                ],
              ),
            ),
            Container(
              height: constraints.maxHeight * 0.2,
              child: FittedBox(
                child: Text(label),
              ),
            ),
          ],
        );
      },
    );
  }
}

final Widget barBase = Container(
  decoration: BoxDecoration(
    color: Color.fromRGBO(220, 220, 220, 1),
    border: Border.all(color: Colors.grey, width: 1),
    borderRadius: BorderRadius.circular(20),
  ),
);

final Function barIndicator = (BuildContext context) {
  return Container(
    decoration: BoxDecoration(
      color: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(20),
    ),
  );
};
