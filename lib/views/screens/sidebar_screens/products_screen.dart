import 'package:flutter/cupertino.dart';

class ProductScreen extends StatelessWidget {
  static const String routeName = '/ProductScreen';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(10),
        child: const Text(
          'All Products are dsisplayed here....',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
