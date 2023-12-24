import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_storage/firebase_storage.dart' as firabase_storage;

import '../widget/Articles_about.dart';
import '../widget/NavigatorLayout.dart';

class Detel_clinic extends StatefulWidget {
  const Detel_clinic({Key? key}) : super(key: key);

  @override
  State<Detel_clinic> createState() => _Detel_clinicState();
}

class _Detel_clinicState extends State<Detel_clinic> {
  //
  String? images;
  bool isItemSaved = false;
  PlatformFile? _pickedFile;
  Uint8List? _fileBytes;

  final TextEditingController _itemNameController = TextEditingController();
  final TextEditingController _itemAddressController = TextEditingController();
  final TextEditingController _itemTimeController = TextEditingController();
  final TextEditingController _itemTimeOutController = TextEditingController();
  final TextEditingController _itemSearchController = TextEditingController();
  final TextEditingController _itemUrlController = TextEditingController();

  void clearTextField() {
    _itemNameController.clear();
    _itemAddressController.clear();
    _itemTimeController.clear();
    _itemSearchController.clear();
    _itemTimeOutController.clear();
    _itemUrlController.clear();
  }

  Future<String?> selctFile() async {
    try {
      final result = await FilePicker.platform.pickFiles();

      if (result == null) return images;
      setState(() {
        _pickedFile = result.files.first;
        _fileBytes = _pickedFile!.bytes;
      });
    } catch (e) {
      // TODO
    }
    return null;
  }

  Future<String> _uploadFile() async {
    String imageUrl = '';
    try {
      firabase_storage.UploadTask uploadTask;

      firabase_storage.Reference ref = firabase_storage.FirebaseStorage.instance
          .ref()
          .child('Dental_News/')
          .child('/' + _pickedFile!.name);

      final metadata =
          firabase_storage.SettableMetadata(contentType: 'image/jpeg');

      uploadTask = ref.putData(_fileBytes!, metadata);

      await uploadTask.whenComplete(() => null);
      imageUrl = await ref.getDownloadURL();
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      imageUrl = ''; // กำหนดให้ imageUrl เป็นสตริงว่างในกรณีเกิดข้อผิดพลาด
    }
    return imageUrl;
  }

  saveItem() async {
    setState(() {
      isItemSaved = true;
    });

    String imageUrl = await _uploadFile(); // อัปโหลดไฟล์ภาพและรับ URL กลับมา

    if (kDebugMode) {
      print('Uploaded Image URL ' + imageUrl);
    }

    // ignore: unnecessary_null_comparison
    if (imageUrl != null) {
      await FirebaseFirestore.instance.collection('Dental_Clinic').add({
        'name': _itemNameController.text,
        'address': _itemAddressController.text,
        'time': _itemTimeController.text,
        'time_out': _itemTimeOutController.text,
        'search': _itemSearchController.text,
        'url': _itemUrlController.text,
        'image_1': imageUrl,
      });
    } else {
      if (kDebugMode) {
        print('Failed to upload image');
      }

      setState(() {
        isItemSaved = false;
      });
    }
    clearTextField();
  }

  Future<void> showAlert(String title, String message) async {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(title),
            content: Text(message),
            actions: <Widget>[
              FilledButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    const Color(
                      0xFF4D0886,
                    ),
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('ok'),
              ),
            ],
          );
        });
  }

  //
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('image/background.jpg'),
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            NavigatorLayout(),
            textfile(),
            Expanded(
              flex: 3,
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                child: const Articles_about(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget textfile() {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Expanded(
      flex: 4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'C  L  I  N  I  C',
            style: GoogleFonts.k2d(
              fontSize: 50,
              color: const Color(0xFF46026D),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              top: height * 0.02,
              left: width * 0.05,
              right: width * 0.05,
            ),
            height: height * 0.70,
            decoration: BoxDecoration(
              color: const Color(0xB2FFFFFF),
              borderRadius: BorderRadius.circular(58),
            ),
            child: Padding(
              padding: EdgeInsets.only(
                top: height * 0.02,
                bottom: height * 0.05,
                right: width * 0.05,
                left: width * 0.05,
              ),
              child: Column(
                children: [
                  TextFormField(
                    controller: _itemNameController,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.person),
                      hintText: 'Name',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: _itemAddressController,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.map),
                      hintText: 'Address',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: _itemTimeController,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.schedule),
                      hintText: 'Time',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: _itemTimeOutController,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.alarm_on),
                      hintText: 'Time Out',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: _itemSearchController,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      hintText: 'Search Name',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: _itemUrlController,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.link),
                      hintText: 'Link Map',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: height * 0.055,
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            border: Border.all(
                              color: Colors.grey,
                              width: height * 0.001,
                            ),
                          ),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.image,
                                color: Colors.grey,
                              ),
                              const SizedBox(width: 8.0),
                              Expanded(
                                child: Text(
                                  _pickedFile?.name ?? 'image',
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: selctFile,
                        icon: const Icon(
                          Icons.add_photo_alternate,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: ElevatedButton(
                      onPressed: () async {
                        // ตรวจสอบว่าข้อมูลที่จำเป็นไม่ว่างเปล่าหรือไม่
                        if (_itemAddressController.text.isEmpty ||
                            _itemNameController.text.isEmpty ||
                            _itemSearchController.text.isEmpty ||
                            _itemTimeController.text.isEmpty ||
                            _itemTimeOutController.text.isEmpty ||
                            _itemUrlController.text.isEmpty) {
                          showAlert('Please fill this out.',
                              "กรุณากรอกข้อมูล ถ้าไม่มีให้ใส - ");
                        } else {
                          // เรียกใช้ saveItem() และรอให้เสร็จสิ้นก่อนที่จะเรียกใช้ showAlert()
                          await saveItem();
                          showAlert('Save Successful', "บันทึกสำเร็จ");
                          setState(() {
                            _pickedFile = null;
                          });
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 20),
                        backgroundColor: const Color(0xFF56078B),
                        textStyle: const TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w400,
                          height: 1.2125,
                        ),
                      ),
                      child: const Text(
                        'U P L O A D',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
