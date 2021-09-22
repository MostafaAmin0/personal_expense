import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_expense/models/transaction.dart';

class TransItem extends StatefulWidget {
  final Transaction tx;
  final Function deleteTrans;

  const TransItem({
    Key? key,
    required this.tx,
    required this.deleteTrans,
  }) : super(key: key);

  @override
  State<TransItem> createState() => _TransItemState();
}

class _TransItemState extends State<TransItem> {
  late Color _bgColor;

  @override
  void initState() {
    super.initState();

    const availableColors = [
      Colors.blue,
      Colors.purple,
      Colors.teal,
      Colors.black,
    ];
    _bgColor = availableColors[Random().nextInt(4)];
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5.0,
      margin: EdgeInsets.symmetric(horizontal: 5.0, vertical: 8.0),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: _bgColor,
          radius: 30.0,
          child: Padding(
            padding: const EdgeInsets.all(6.0),
            child: FittedBox(
              child: Text('\$${widget.tx.money.toStringAsFixed(2)}'),
            ),
          ),
        ),
        title: Text(
          widget.tx.name,
          style: Theme.of(context).textTheme.headline6,
        ),
        subtitle: Text(
          DateFormat.yMMMd().format(widget.tx.date),
        ),
        trailing: MediaQuery.of(context).size.width > 460
            ? TextButton.icon(
                icon: Icon(Icons.delete),
                style:
                    TextButton.styleFrom(primary: Theme.of(context).errorColor),
                onPressed: () {
                  widget.deleteTrans(widget.tx.id);
                },
                label: Text(
                  'Delete',
                  style: TextStyle(color: Theme.of(context).errorColor),
                ),
              )
            : TextButton(
                child: Icon(Icons.delete),
                style:
                    TextButton.styleFrom(primary: Theme.of(context).errorColor),
                onPressed: () {
                  widget.deleteTrans(widget.tx.id);
                },
              ),
      ),
    );
  }
}
