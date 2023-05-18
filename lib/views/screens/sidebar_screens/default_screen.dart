import 'package:flutter/cupertino.dart';

class DefaultScreen extends StatelessWidget {
  static const String routeName = '/DefaultScreen';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: Color.fromRGBO(177, 12, 48, 1.0),
        alignment: Alignment.center,
        padding: const EdgeInsets.all(10),
        child: const Text(
          'You are on the default screen.',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
