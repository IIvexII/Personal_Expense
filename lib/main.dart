import 'package:Personal_Expense/widgets/transectionList.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import './widgets/newTransection.dart';
import './modules/transection.dart';

void main() => runApp(PersonalExpense());

class PersonalExpense extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Personal Expense',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transection> _userTransections = [
    Transection(
      id: 't1',
      title: 'New Shoes',
      amount: 400.00,
      date: DateTime.now(),
    ),
    Transection(
      id: 't2',
      title: 'Mouse',
      amount: 250.00,
      date: DateTime.now(),
    )
  ];

  void _addNewTransection(String txTitle, double txAmount, String txId) {
    final newTx = Transection(
      title: txTitle,
      amount: txAmount,
      id: txId,
      date: DateTime.now(),
    );

    setState(() {
      _userTransections.add(newTx);
    });
  }

  void _startAddNewTransection(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return GestureDetector(
          onTap: () {},
          child: NewTransection(_addNewTransection),
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Personal Expenses'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => _startAddNewTransection(context),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Card(
              color: Colors.blue,
              child: Text(
                'CHART',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w500),
                textAlign: TextAlign.center,
              ),
              elevation: 20,
            ),
            TransectionList(_userTransections),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _startAddNewTransection(context),
      ),
    );
  }
}
