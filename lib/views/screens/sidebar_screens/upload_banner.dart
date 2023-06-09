import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:logger/logger.dart';
import 'package:ncg_shopping_app/views/screens/sidebar_screens/widgets/upload_banner_widget.dart';

class UploadBanner extends StatefulWidget {
  static const String routeName = '/UploadScreen';

  @override
  _UploadBannerState createState() => _UploadBannerState();
}

class _UploadBannerState extends State<UploadBanner> {
  final FirebaseStorage _storage = FirebaseStorage.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  dynamic _image;
  var logger = Logger();
  String fileName = '';

  pickImage() async {
    FilePickerResult? result = await FilePicker.platform
        .pickFiles(allowMultiple: false, type: FileType.image);
    if (result != null) {
      setState(() {
        _image = result.files.first.bytes;
        fileName = result.files.first.name;
        print(fileName);
        logger.i(fileName);
      });
    }
  }

  _uploadBannersToStorage(dynamic image) async {
    Reference ref = _storage.ref().child('Banners').child(fileName!);
    UploadTask uploadTask = ref.putData(image);
    await uploadTask;

    TaskSnapshot snapshot = await uploadTask;
    String downloadUrl = await snapshot.ref.getDownloadURL();
    //return downloadUrl;
    await _firestore.collection('Banners').doc(fileName).set({
      'fileName': fileName,
      'url': downloadUrl,
      'createdAt': Timestamp.now(),
    }).whenComplete(() {
      setState(() {
        _image = null;
        fileName = "";
      });
      EasyLoading.dismiss();
      EasyLoading.showSuccess('Uploaded Successfully');

    });
  }

  Future<void> uploadBannersToFirestore() async {
    EasyLoading.show();
    if (_image != null) {
      String downloadUrl = await _uploadBannersToStorage(_image);
      await _firestore.collection('Banners').doc(fileName).set({
        'url': downloadUrl,
        'fileName': fileName,
        'createdAt': Timestamp.now(),
      }).whenComplete(() {
        setState(() {
          _image = null;
          fileName = "";
        });
        EasyLoading.dismiss();
        EasyLoading.showSuccess('Uploaded Successfully');
      });
    } else {
      EasyLoading.showError('Please select an image');
    }
  }

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
                          ? Image.memory(
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
                      child: Text('Upload Image'),
                    ),
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
                onPressed: () async {
                  uploadBannersToFirestore(

                  );
                 /* if (_image != null) {
                    String downloadUrl = await uploadBannersToStorage(_image);
                    // Save the downloadUrl or perform other actions
                    print('Download URL: $downloadUrl');
                  } else {
                    // Handle case when no image is selected
                  }*/
                },
                child: Text('Save'),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Divider(
              color: Colors.grey.shade700,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              //color: Color.fromRGBO(105, 159, 149, 0.996),
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.all(10.0),
              child: const Text(
                'Uploaded Banners Images....',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Divider(
              color: Colors.grey.shade700,
            ),
          ),
          UploadBannerWidget(),
        ],
      ),
    );
  }
}
