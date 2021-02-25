import 'package:flutter/material.dart';

import './newTransection.dart';
import './transectionList.dart';
import '../modules/transection.dart';

class UserTransection extends StatefulWidget {
  @override
  _UserTransectionState createState() => _UserTransectionState();
}

class _UserTransectionState extends State<UserTransection> {
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

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        // New Transection Input
        NewTransection(_addNewTransection),
        // List of Transections
        TransectionList(_userTransections),
      ],
    );
  }
}
