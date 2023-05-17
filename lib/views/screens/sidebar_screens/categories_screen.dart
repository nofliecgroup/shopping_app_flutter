import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CategoriesScreen extends StatelessWidget {
  static const String routeName = '/CategoryScreen';


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
                      child: const Icon(
                        Icons.add_a_photo,
                        color: Colors.red,
                        size: 50,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),

                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.amber.shade900,
                      ),
                      onPressed: () {},
                      child: Text('Upload Image'),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 10,
              ),

              SizedBox(
                width: 300,
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Category Name',
                  ),
                ),
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
