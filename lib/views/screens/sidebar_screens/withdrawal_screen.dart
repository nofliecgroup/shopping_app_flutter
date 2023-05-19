import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WithdrawaScreen extends StatelessWidget {
  static const String routeName = '/WithdrawalScreen';

  Widget _rowHeader(String header, int flex) {
    return Expanded(
      flex: 1,
      child: Container(
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 4, 156, 70),
          border: Border.all(
            color: Color.fromARGB(255, 190, 21, 21),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            header,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 12, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            color: Color.fromARGB(255, 232, 4, 137),
            alignment: Alignment.center,
            padding: const EdgeInsets.all(10),
            child: const Text(
              'Withdrawal Requests',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          Row(
            children: [
              _rowHeader('Vendor Profile', 1),
              _rowHeader('Vendor Name', 1),
              _rowHeader('Vendor Address', 3),
              _rowHeader('Vendor Phone', 1),
              _rowHeader('Vendor Email', 2),
              _rowHeader('Vendor Status', 1),
              _rowHeader('Vendor Action', 1),
            ],
          )
        ],
      ),
    );
  }
}
