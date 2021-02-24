import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import './transection.dart';

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

class MyHomePage extends StatelessWidget {
  // Demo transections
  final List<Transection> transections = [
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
    return Scaffold(
        appBar: AppBar(
          title: Text('Personal Expenses'),
        ),
        body: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
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
            // List of Transections
            Column(
              children: transections.map((tx) {
                return Card(
                  elevation: 5,
                  child: Row(
                    children: <Widget>[
                      //----------Amount of Expense--------------
                      Container(
                        margin: EdgeInsets.all(20),
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.purple,
                            width: 2,
                          ),
                        ),
                        child: Text(
                          'Rs. ${tx.amount}',
                          style: TextStyle(
                            color: Colors.purple,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      //-----------------------------------------
                      //---------Title and Date of expense-------
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          //-------Title-------
                          Container(
                            margin: EdgeInsets.only(bottom: 10),
                            child: Text(
                              tx.title,
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          //-----End Title-----
                          //--------Date--------
                          Container(
                            child: Text(
                              DateFormat.yMMMEd().add_jm().format(tx.date),
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                          ),
                          //------End Date------
                        ],
                      )
                      //------------------------------------------
                    ],
                  ),
                );
              }).toList(),
            )
          ],
        ));
  }
}
