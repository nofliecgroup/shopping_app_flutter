import 'package:flutter/cupertino.dart';

class DashboardScreen extends StatelessWidget {
  static const String routeName = '/DashboardScreen';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: Color.fromRGBO(234, 226, 10, 1.0),
        alignment: Alignment.center,
        padding: const EdgeInsets.all(10),
        child: const Text(
          'This is the Dashboard screen',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
