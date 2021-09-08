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
          margin: EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 15,
          ),
          decoration: BoxDecoration(
            border: Border.all(width: 2.0, color: Colors.purple),
          ),
          padding: EdgeInsets.all(2.5),
          child: Text(
            '\$$money',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
              color: Colors.purple,
            ),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              ),
            ),
            Text(
              date.toString(),
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 12.0,
                color: Colors.grey,
              ),
            )
          ],
        )
      ],
    );
  }
}
