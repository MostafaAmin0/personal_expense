import 'package:flutter/material.dart';

class TransItem extends StatelessWidget {
  final String name;
  final DateTime date;
  final double money;

  TransItem({required this.name, required this.date, required this.money});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          child: Text(
            money.toString(),
          ),
        ),
        Column(
          children: [
            Text(
              name,
            ),
            Text(
              date.toString(),
            )
          ],
        )
      ],
    );
  }
}
