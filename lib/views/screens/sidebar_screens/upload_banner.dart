import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'dart:io';

import 'package:logger/logger.dart';

class UploadBanner extends StatefulWidget {
  static const String routeName = '/UploadScreen';

  @override
  _UploadBannerState createState() => _UploadBannerState();
}

class _UploadBannerState extends State<UploadBanner> {
  //final FirebaseStorage _storage = FirebaseStorage.instance;
  //final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  var logger = Logger();
  File? _image;
  String? fileName = '';

  pickImage() async {
    FilePickerResult? result = await FilePicker.platform
        .pickFiles(allowMultiple: false, type: FileType.image);
    if (result != null) {
      setState(() {
        // _image = File(result.files.single.path);
        _image = result.files.single.path != null
            ? File(result.files.single.path!)
            : null;

        fileName = result.files.first.name;
        print(fileName);
        logger.i(fileName);
      });
    }
  }

  /*  _uploadBannersToStorage(dynamic image) async {
    Reference ref = _storage.ref().child('Banners').child(fileName!);
    UploadTask uploadTask = ref.putData(image);
    TaskSnapshot snapshot = await uploadTask;
    String downloadUrl = await snapshot.ref.getDownloadURL();
    return downloadUrl;
  } */

/*   uploadToFirebaseStore() async {
    if(_image != null) {
     String imageUrl = await _uploadBannersToStorage(_image!).then((value) => print('Done'));
     await  _firestore.collection('Banners').doc(fileName).set({
       'imageUrl': imageUrl,
       'fileName': fileName,
     }).then((value) => print('Done'));

    }
  }
 */
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
                      child: _image != null
                          ? Image.file(
                              _image!,
                              fit: BoxFit.cover,
                            )
                          : const Icon(
                              Icons.add_a_photo,
                              color: Colors.red,
                              size: 50,
                            ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [Text(fileName!)],
                    ),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.amber.shade900,
                        ),
                        onPressed: pickImage,
                        child: Text('Upload Image'))
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
                onPressed: () {
                  //uploadToFirebaseStore();
                },
                child: Text('Save'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
