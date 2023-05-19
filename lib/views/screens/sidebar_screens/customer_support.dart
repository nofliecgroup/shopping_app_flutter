import 'dart:async';

import 'package:auto_size_text_field/auto_size_text_field.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomerSupportCenter extends StatefulWidget {
  static const String routeName = '/CustomerSupportCenter';

  //const CustomerSupportCenter({super.key});

  @override
  State<CustomerSupportCenter> createState() => _CustomerSupportCenterState();
}

class _CustomerSupportCenterState extends State<CustomerSupportCenter> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // TextEditingController _firstnameController = TextEditingController();
  // TextEditingController _lastnameController = TextEditingController();
  // TextEditingController _phoneController = TextEditingController();
  // TextEditingController _emailController = TextEditingController();
  // TextEditingController _subjectController = TextEditingController();
  // TextEditingController _messageController = TextEditingController();

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

    validateForm() {
      if (_formKey.currentState!.validate()) {
        print('data is valid');
      } else {
        print('data isNot Validated');
      }
    }

    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
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
            SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.all(10),
              height: 500, // Provide a finite height constraint
              child: ListView(
                children: [
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your full name';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: 'Full Name',
                      labelStyle: TextStyle(
                        color: Colors.black,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  //SizedBox(height: 10),
                  // TextFormField(
                  //   validator: (value) {
                  //     if (value == null || value.isEmpty) {
                  //       return 'Please enter your last name';
                  //     }
                  //     return null;
                  //   },
                  //   decoration: InputDecoration(
                  //     labelText: 'Last Name',
                  //     labelStyle: TextStyle(
                  //       color: Colors.black,
                  //     ),
                  //     border: OutlineInputBorder(
                  //       borderRadius: BorderRadius.circular(10),
                  //     ),
                  //   ),
                  // ),
                  SizedBox(height: 10),
                  TextFormField(
                    validator: (value) {
                      if(EmailValidator.validate(value!)){
                        return null;
                      }else{
                        return 'Please enter a valid email address';
                      }
                    },
                    decoration: InputDecoration(
                      labelText: 'Email',
                      hintText: 'Enter a valid email address',
                      labelStyle: TextStyle(
                        color: Colors.black,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your phone number';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: 'Phone Number',
                      hintText: 'Number should be 10 digits',
                      labelStyle: TextStyle(
                        color: Colors.black,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(10),
                      FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                    ],
                  ),

                  // TextFormField(
                  //   validator: (value) {
                  //     if (value == null || value.isEmpty) {
                  //       return 'Please enter your phone number';
                  //     }
                  //     return null;
                  //   },
                  //   decoration: InputDecoration(
                  //     labelText: 'Phone Number',
                  //     labelStyle: TextStyle(
                  //       color: Colors.black,
                  //     ),
                  //     border: OutlineInputBorder(
                  //       borderRadius: BorderRadius.circular(10),
                  //     ),
                  //   ),
                  // ),
                  SizedBox(height: 10),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your subject';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: 'Subject',
                      labelStyle: TextStyle(
                        color: Colors.black,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  TextField(
                    //controller: _textEditingController,
                    style: TextStyle(fontSize: 20),
                    maxLines: null,
                    decoration: InputDecoration(
                      hintText: 'Enter your message here',
                      border: InputBorder.none,
                      isDense: true,
                      contentPadding: const EdgeInsets.all(15),
                      
                    ),
                    
                  ),
                  // SizedBox(
                  //   height: 100,
                  //   child: TextField(
                  //     maxLines: null, // Allows the field to expand vertically
                  //     decoration: InputDecoration(
                  //       labelText: 'Message',
                  //       labelStyle: TextStyle(
                  //         color: Colors.black,
                  //       ),
                  //       border: OutlineInputBorder(
                  //         borderRadius: BorderRadius.circular(10),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),
            SizedBox(height: 3.0),
            SizedBox(
              width: double.infinity,
              height: 100,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () {
                    validateForm();
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Processing Data')),
                    );
                  },
                  child: Text(
                    'Submit Your Message',
                    style: TextStyle(fontSize: 20),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
