import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../modules/transection.dart';

class TransectionList extends StatelessWidget {
  final List<Transection> _userTransections;

  TransectionList(this._userTransections);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      height: 550,
      child: ListView.builder(
        itemBuilder: (ctx, index) {
          return Card(
            elevation: 5,
            child: Row(
              children: <Widget>[
                //############################################
                //-------------AMOUNT OF EXPENSE--------------
                //############################################
                Container(
                  margin: EdgeInsets.all(20),
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Theme.of(context).primaryColorDark,
                      width: 2,
                    ),
                  ),
                  child: Text(
                    'Rs. ${_userTransections[index].amount}',
                    style: TextStyle(
                      color: Theme.of(context).primaryColorDark,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                //###############################################
                //------------END OF EXPENSE AMOUNT--------------
                //###############################################
                //----------Title and Date of expense------------
                //###############################################
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(bottom: 10),
                      child: Text(
                        _userTransections[index].title, // TITLE
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      child: Text(
                        DateFormat.yMMMEd()
                            .add_jm()
                            .format(_userTransections[index].date),
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ],
                )
                //###############################################
                //-------------END OF TITLE AND DATE-------------
                //###############################################
              ],
            ),
          );
        },
        itemCount: _userTransections.length,
      ),
    );
  }
}
