import 'package:flutter/material.dart';

class NewTransection extends StatefulWidget {
  final Function addNewTransection;

  NewTransection(this.addNewTransection);

  @override
  _NewTransectionState createState() => _NewTransectionState();
}

class _NewTransectionState extends State<NewTransection> {
  final _titleControler = TextEditingController();

  final _amountControler = TextEditingController();

  void submitData() {
    final enteredTitle = _titleControler.text;
    final enteredAmount = double.parse(_amountControler.text);

    // Check the validity
    if (enteredTitle.isEmpty || enteredAmount <= 0) return;

    // Add a transection
    widget.addNewTransection(
      enteredTitle,
      enteredAmount,
      "#DEMO123",
    );

    Navigator.of(context).pop();
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
                  color: Theme.of(context).primaryColorDark,
                  fontSize: 20,
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
