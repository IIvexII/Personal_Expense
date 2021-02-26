import 'package:flutter/material.dart';

import './widgets/newTransection.dart';
import './modules/transection.dart';
import './widgets/transectionList.dart';

void main() => runApp(PersonalExpense());

class PersonalExpense extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Personal Expense',
      theme: ThemeData(
          primarySwatch: Colors.amber,
          accentColor: Colors.amberAccent,
          fontFamily: 'Quicksand',
          textTheme: ThemeData.light().textTheme.copyWith(
                  headline6: TextStyle(
                fontFamily: 'OpenSans',
                fontSize: 18,
                fontWeight: FontWeight.bold,
              )),
          appBarTheme: AppBarTheme(
            textTheme: ThemeData.light().textTheme.copyWith(
                    headline6: TextStyle(
                  fontFamily: 'OpenSans',
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                )),
          )),
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
    // Transection(
    //   id: 't1',
    //   title: 'New Shoes',
    //   amount: 400.00,
    //   date: DateTime.now(),
    // ),
    // Transection(
    //   id: 't2',
    //   title: 'Mouse',
    //   amount: 250.00,
    //   date: DateTime.now(),
    // )
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
              color: Theme.of(context).accentColor,
              child: Text(
                'CHART',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
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
