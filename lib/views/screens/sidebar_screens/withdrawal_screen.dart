import 'package:flutter/cupertino.dart';

class WithdrawaScreen extends StatelessWidget {
  static const String routeName = '/WithdrawalScreen';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(10),
        child: const Text(
          'Financial transactions are displayed.... Withdrawal Screen',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
