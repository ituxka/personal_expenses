import 'package:flutter/material.dart';

class Chart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Card(
        color: Colors.blue,
        elevation: 5,
        child: Text('Chart!'),
      ),
    );
  }
}
