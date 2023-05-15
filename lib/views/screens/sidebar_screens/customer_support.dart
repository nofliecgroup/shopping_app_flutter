import 'package:flutter/cupertino.dart';

class CustomerSupportCenter extends StatelessWidget {
  static const String routeName = '/CustomerSupportCenter';

  const CustomerSupportCenter({super.key});

  @override
  Widget build(BuildContext context) {
    final date = DateTime.now();

    return SingleChildScrollView(
      child: Container(
        color: Color.fromRGBO(105, 159, 149, 0.996),
        alignment: Alignment.center,
        padding: const EdgeInsets.all(10),
        child: Center(
          child: Text(
            date.toString(),
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
