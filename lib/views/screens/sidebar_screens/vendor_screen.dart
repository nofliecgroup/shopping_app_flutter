import 'package:flutter/cupertino.dart';

class VendorScreen extends StatelessWidget {
  static const String routeName = '/VendorScreen';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: Color.fromRGBO(14, 44, 163, 0.992),
        alignment: Alignment.center,
        padding: const EdgeInsets.all(10),
        child: const Text(
          'All Vendors are Manage here....',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
