import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CategoryImagesWidget extends StatefulWidget {
  @override
  State<CategoryImagesWidget> createState() => _CategoryImagesWidgetState();
}

class _CategoryImagesWidgetState extends State<CategoryImagesWidget> {
  final Stream<QuerySnapshot> _categoryStream =
      FirebaseFirestore.instance.collection('CategoryImages').snapshots();

  String? filename;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _categoryStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(
              color: Colors.amber,
            ),
          );
        }
        return SizedBox(
          height: 300,
          child: GridView.builder(
            shrinkWrap: true,
              //itemCount: snapshot.data!.docs.length,
              itemCount: snapshot.data!.size,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 6,
                mainAxisSpacing: 3.0,
                childAspectRatio: 1.0,
                crossAxisSpacing: 3.0,
              ),
              itemBuilder: (BuildContext context, int index) {
                final categoryData = snapshot.data!.docs[index];
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        height: 150,
                        width: 150,
                        child: Image.network(
                          categoryData['url'],
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Text(categoryData['categoryName']),
                  ],
                );
              }),
        );
        /*return ListView(
        children: snapshot.data!.docs.map((DocumentSnapshot document) {
          Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
          return ListTile(
            title: Text(data['name']),
            subtitle: Text(data['filename']),
          );
        }).toList(),
      );*/
      },
    );
  }
}
