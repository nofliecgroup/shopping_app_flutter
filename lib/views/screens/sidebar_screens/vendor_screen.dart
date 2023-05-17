import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class VendorScreen extends StatelessWidget {
  static const String routeName = '/VendorScreen';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            color: Color.fromRGBO(105, 159, 149, 0.996),
            alignment: Alignment.topLeft,
            padding: const EdgeInsets.all(10.0),
            child: const Text(
              'Banners Images are uploaded here....',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 36,
              ),
            ),
          ),
          Divider(
            color: Colors.grey.shade700,
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Container(
                      height: 160,
                      width: 160,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade500,
                        border: Border.all(color: Colors.grey.shade400),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [Text('Upload Category')],
                    ),
                    //ElevatedButton(),
                  ],
                ),
              ),
              SizedBox(
                width: 10,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green.shade800,
                  elevation: 4.0,
                ),
                onPressed: () async {},
                child: Text('Save'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
