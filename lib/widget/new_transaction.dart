import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;
  NewTransaction(this.addTx);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final priceController = TextEditingController();

  void submitData() {
    if (priceController.text.isEmpty) return;

    final enteredPrice = double.parse(priceController.text);
    final enteredTitle = titleController.text;

    if (enteredTitle.isEmpty || enteredPrice < 0) return;

    widget.addTx(enteredTitle, enteredPrice);
    titleController.clear();
    priceController.clear();
    Navigator.pop(context);
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
              margin: EdgeInsets.symmetric(vertical: 10.0),
              child: TextButton(
                onPressed: submitData,
                style: TextButton.styleFrom(
                  padding: EdgeInsets.all(15.0),
                  backgroundColor: Colors.blue,
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
