import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UploadBannerWidget extends StatelessWidget {
  final Stream<QuerySnapshot> _uploadBannersStream =
      FirebaseFirestore.instance.collection('Banners').snapshots();

  String filename = '';

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _uploadBannersStream,
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
              itemCount: snapshot.data!.docs.length,
              //itemCount: snapshot.data!.size,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 6,
                mainAxisSpacing: 3.0,
                childAspectRatio: 1.0,
                crossAxisSpacing: 3.0,
              ),
              itemBuilder: (BuildContext context, int index) {
                final uploadBannerData = snapshot.data!.docs[index];
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        height: 150,
                        width: 150,
                        child: Image.network(
                          uploadBannerData['url'],
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Text(uploadBannerData['fileName']),
                  ],
                );
              }),
        );
      },
    );
  }
}
