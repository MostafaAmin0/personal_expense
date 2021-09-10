import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final Function addTx;
  NewTransaction(this.addTx);

  final titleController =TextEditingController();
  final priceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    String? titleInput;
    String? priceInput;
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
              onChanged: (title) {
                titleInput = title;
              },
              controller: titleController,
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Amount',
              ),
              onChanged: (price) {
                priceInput = price;
              },
              controller: priceController,
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10.0),
              child: TextButton(
                onPressed: (){
                  addTx(titleInput,priceInput);
                  titleController.clear();
                  priceController.clear();
                },
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
