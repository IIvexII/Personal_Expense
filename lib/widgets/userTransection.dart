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

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        // New Transection Input
        NewTransection(),
        // List of Transections
        TransectionList(_userTransections),
      ],
    );
  }
}
