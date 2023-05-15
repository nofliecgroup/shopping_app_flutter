import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomerSupportCenter extends StatefulWidget {
  static const String routeName = '/CustomerSupportCenter';

  const CustomerSupportCenter({super.key});

  @override
  State<CustomerSupportCenter> createState() => _CustomerSupportCenterState();
}

class _CustomerSupportCenterState extends State<CustomerSupportCenter> {
/*   String formattedTime = DateFormat('kk:mm').format(DateTime.now());
  String hour = DateFormat('a').format(DateTime.now()); */
  late Timer _timer;

  @override
  Widget build(BuildContext context) {
    final date = DateTime.now();
    late String _timeString = "${date.hour} : ${date.minute} :${date.second}";

    void _getCurrentTime() {
      setState(() {
        _timeString =
            "${DateTime.now().hour} : ${DateTime.now().minute} :${DateTime.now().second}";
      });
    }

    @override
    void initState() {
      _timeString =
          "${DateTime.now().hour} : ${DateTime.now().minute} :${DateTime.now().second}";
      Timer.periodic(Duration(seconds: 1), (Timer t) => _getCurrentTime());
      super.initState();
    }

    return SingleChildScrollView(
      child: Container(
        color: Color.fromRGBO(13, 29, 207, 0.988),
        alignment: Alignment.center,
        padding: const EdgeInsets.all(10),
        child: Center(
          child: Text(
            _timeString.toString(),
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
