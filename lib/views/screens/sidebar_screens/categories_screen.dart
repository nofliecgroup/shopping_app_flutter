import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:logger/logger.dart';
import 'package:ncg_shopping_app/views/screens/sidebar_screens/widgets/category_widget.dart';

class CategoriesScreen extends StatefulWidget {
  static const String routeName = '/CategoryScreen';

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  final FirebaseStorage _storage = FirebaseStorage.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  dynamic _image;
  var logger = Logger();
  String? fileName = '';
  String? categoryName = '';

  _pickImage() async {
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

  _uploadImageCategoryToStorage(dynamic image) async {
    EasyLoading.show();
    //create a folder name CategoryImage in firebase storage
    Reference ref = _storage.ref().child('CategoryImages').child(fileName!);
    UploadTask uploadTask = ref.putData(image);
    TaskSnapshot snapshot = await uploadTask;
    String downloadUrl = await snapshot.ref.getDownloadURL();
    await _firestore.collection('CategoryImages').doc(fileName).set({
      'url': downloadUrl,
      'categoryName': categoryName,
      'createdAt': Timestamp.now(),
    }).whenComplete(() {
      setState(() {
        _image = null;
        fileName = "";
        _formKey.currentState!.reset();
      });
      EasyLoading.dismiss();
      EasyLoading.showSuccess('Uploaded Successfully');
    });
  }

  uploadCategoryImage() async {
    if (_formKey.currentState!.validate()) {
      String uploadCategory = await _uploadImageCategoryToStorage(_image);
      return uploadCategory;
      // _formKey.currentState!.save();
    } else {
      print('Error, category name is required');
    }
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ));
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
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
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Divider(
                  color: Colors.grey.shade700,
                ),
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
                                  CupertinoIcons.photo_fill_on_rectangle_fill,
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
                          onPressed: () {
                            _pickImage();
                          },
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
                      onChanged: (value) {
                        setState(() {
                          categoryName = value;
                        });
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter the category name';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        labelText: 'Enter Category Name',
                      ),
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green.shade800,
                      elevation: 4.0,
                    ),
                    onPressed: () async {
                      uploadCategoryImage();
                    },
                    child: Text('Save Category'),
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
                  alignment: Alignment.topLeft,
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    'Category List',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              CategoryImagesWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
