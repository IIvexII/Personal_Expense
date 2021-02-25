import 'package:flutter/material.dart';

class NewTransection extends StatelessWidget {
  final _titleControler = TextEditingController();
  final _amountControler = TextEditingController();
  final Function addNewTransection;

  NewTransection(this.addNewTransection);

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
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: _amountControler,
            ),
            FlatButton(
              child: Text(
                'Add Transection',
                style: TextStyle(
                  color: Colors.purple,
                ),
              ),
              onPressed: () {
                addNewTransection(
                  _titleControler.text,
                  double.parse(_amountControler.text),
                  '#DEMO123',
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
