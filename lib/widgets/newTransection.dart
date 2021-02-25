import 'package:flutter/material.dart';

class NewTransection extends StatelessWidget {
  final _titleControler = TextEditingController();
  final _amountControler = TextEditingController();
  final Function addNewTransection;

  NewTransection(this.addNewTransection);

  void submitData() {
    final enteredTitle = _titleControler.text;
    final enteredAmount = double.parse(_amountControler.text);

    // Check the validity
    if (enteredTitle.isEmpty || enteredAmount <= 0) return;

    // Add a transection
    addNewTransection(
      enteredTitle,
      enteredAmount,
      "#DEMO123",
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        margin: EdgeInsets.fromLTRB(5, 20, 5, 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              controller: _titleControler,
              onSubmitted: (_) => submitData(),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: _amountControler,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => submitData(),
            ),
            FlatButton(
              child: Text(
                'Add Transection',
                style: TextStyle(
                  color: Colors.purple,
                ),
              ),
              onPressed: submitData,
            ),
          ],
        ),
      ),
    );
  }
}
