import 'package:flutter/cupertino.dart';

class OrderScreen extends StatelessWidget {
  static const String routeName = '/OrderScreen';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: Color.fromRGBO(105, 159, 149, 0.996),
        alignment: Alignment.center,
        padding: const EdgeInsets.all(10),
        child: const Text(
          'This is the Orders Screen',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
