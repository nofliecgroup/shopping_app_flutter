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

  Widget _rowHeader(String header, int flex) {
    return Expanded(
      flex: 1,
      child: Container(
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 4, 156, 70),
          border: Border.all(
            color: Color.fromARGB(255, 190, 21, 21),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            header,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 12, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Container(
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
          Row(
            children: [
              _rowHeader('Product', 1),
              _rowHeader('FullName', 1),
              _rowHeader('Email', 1),
              _rowHeader('Phone', 1),
              _rowHeader('Quantity', 1),
              _rowHeader('Price', 1),
              _rowHeader('Total', 1),
              _rowHeader('Country', 1),
              _rowHeader('City', 1),
              _rowHeader('Address', 1),
              _rowHeader('Status', 1),
              _rowHeader('Action', 1),
            ],
          ),
        ],
      ),
    );
  }
}
