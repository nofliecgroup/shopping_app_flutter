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
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _issueController = TextEditingController();

  late Timer _timer;
  late String _timeString;

  @override
  void initState() {
    _timeString = _getCurrentTime();
    Timer.periodic(Duration(seconds: 1), (Timer t) => _getCurrentTime());
    super.initState();
  }

  String _getCurrentTime() {
    return "${DateTime.now().hour} : ${DateTime.now().minute} :${DateTime.now().second}";
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Send data to backend API and create support ticket
      print('Submitting form...');
      print('Name: ${_nameController.text}');
      print('Email: ${_emailController.text}');
      print('Issue: ${_issueController.text}');

      // Display confirmation message to customer
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Thank you for submitting your support request!'),
        ),
      );
      // Clear form fields
      _nameController.clear();
      _emailController.clear();
      _issueController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: Color.fromRGBO(13, 29, 207, 0.988),
        alignment: Alignment.center,
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Text(
              _timeString.toString(),
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 20),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: _nameController,
                    decoration: InputDecoration(
                      labelText: 'Enter your name',
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your name';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      labelText: 'Email',
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your email address';
                      } else if (!value.contains('@')) {
                        return 'Please enter a valid email address';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    controller: _issueController,
                    maxLines: 5,
                    decoration: InputDecoration(
                      labelText: 'Issue',
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter a description of your issue';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: _submitForm,
                    child: Text('Submit'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
