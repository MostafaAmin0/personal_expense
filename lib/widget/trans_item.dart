import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransItem extends StatelessWidget {
  final String name;
  final DateTime date;
  final double money;

  TransItem({required this.name, required this.date, required this.money});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5.0,
      margin: EdgeInsets.symmetric(horizontal: 5.0, vertical: 8.0),
      child: ListTile(
        leading: CircleAvatar(
          radius: 30.0,
          child: Padding(
            padding: const EdgeInsets.all(6.0),
            child: FittedBox(
              child: Text('\$${money.toStringAsFixed(2)}'),
            ),
          ),
        ),
        title: Text(
          name,
          style: Theme.of(context).textTheme.headline6,
        ),
        subtitle: Text(
          DateFormat.yMMMd().format(date),
        ),
      ),
    );
  }

  /*
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
            border: Border.all(width: 2.0, color: Theme.of(context).primaryColorDark),
          ),
          padding: EdgeInsets.all(2.5),
          child: Text(
            '\$${money.toStringAsFixed(2)}',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
              color: Theme.of(context).primaryColorDark,
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
              DateFormat.yMMMd().format(date),
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
  */
}
