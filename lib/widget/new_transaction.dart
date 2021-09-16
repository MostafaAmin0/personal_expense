import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;
  NewTransaction(this.addTx);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();
  final priceController = TextEditingController();
  DateTime? _selectedDate;

  void submitData() {
    if (priceController.text.isEmpty) return;

    final enteredPrice = double.parse(priceController.text);
    final enteredTitle = titleController.text;

    if (enteredTitle.isEmpty || enteredPrice < 0 || _selectedDate == null) return;

    widget.addTx(enteredTitle, enteredPrice,_selectedDate);
    titleController.clear();
    priceController.clear();
    Navigator.pop(context);
  }

  void _showDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2021),
      lastDate: DateTime.now(),
    ).then((value) {
      if (value != null) {
        setState(() {
          _selectedDate = value;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // String? titleInput;
    // String? priceInput;
    return Card(
      elevation: 5.0,
      child: Container(
        margin: EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Title',
              ),
              // onChanged: (title) {
              //   titleInput = title;
              // },
              controller: titleController,
              onSubmitted: (_) => submitData(),
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Amount',
              ),
              // onChanged: (price) {
              //   priceInput = price;
              // },
              controller: priceController,
              onSubmitted: (_) => submitData(),
              keyboardType: TextInputType.number,
            ),
            Container(
              height: 60,
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      _selectedDate == null
                          ? 'No Date Choosen'
                          : 'Picked Date : ${DateFormat.yMMMd().format(_selectedDate!)}',
                    ),
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      primary: Theme.of(context).primaryColor,
                    ),
                    onPressed: _showDatePicker,
                    child: Text(
                      'Choose Date',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10.0),
              child: TextButton(
                onPressed: submitData,
                style: TextButton.styleFrom(
                  padding: EdgeInsets.all(15.0),
                  backgroundColor: Theme.of(context).primaryColor,
                  primary: Colors.white,
                ),
                child: Text('Add Transaction'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
