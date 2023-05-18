import 'package:flutter/material.dart';

class VendorScreen extends StatelessWidget {
  static const String routeName =  '/VendorScreen';


  Widget _rowHeader() {
  return Expanded(
    child: Container(
    color: Color.fromRGBO(177, 12, 48, 1.0),
    alignment: Alignment.center,
    padding: const EdgeInsets.all(10),
    child: const Text(
      'Manage Vendors',
      style: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold, color: Colors.white,
      ),
    ),
  ),
  );
}

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: Color.fromRGBO(177, 12, 48, 1.0),
        alignment: Alignment.center,
        padding: const EdgeInsets.all(10),
        child: const Text(
          'Manage Vendors',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold, color: Colors.white,
          ),
        ),
      ),
    );
  }
}
