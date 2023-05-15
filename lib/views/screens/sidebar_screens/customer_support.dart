import 'package:flutter/cupertino.dart';

class CustomerSupportCenter extends StatelessWidget {
  static const String routeName = '/CustomerSupportCenter';

  const CustomerSupportCenter({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: Color.fromRGBO(105, 159, 149, 0.996),
        alignment: Alignment.center,
        padding: const EdgeInsets.all(10),
        child: Center(
          child: const Text(
            'This is the Customer Support Center',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}