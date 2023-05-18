import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OrderScreen extends StatelessWidget {
  static const String routeName = '/OrderScreen';
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  validateSearch() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
    } else {
      print('Enter a category name to search the order');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Container(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Enter a category name to search the order';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelText: 'search for orders',
                  // border: OutlineInputBorder(
                  //   borderRadius: BorderRadius.circular(10.0),
                  // ),
                ),
              ),
            ),
            SizedBox(
              width: 10.0,
            ),
            Expanded(
              flex: 1,
              child: ElevatedButton(
                onPressed: () {
                  validateSearch();
                },
                child: const Text('Search'),
              ),
            ),
          ],
        ),


      ),
    );
  }

}
