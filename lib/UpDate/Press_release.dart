import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:firebase_storage/firebase_storage.dart' as firabase_storage;
import 'package:google_fonts/google_fonts.dart';

import '../widget/Articles_about.dart';
import '../widget/NavigatorLayout.dart';

class Press_release extends StatefulWidget {
  const Press_release({super.key});

  @override
  State<Press_release> createState() => _Press_releaseState();
}

class _Press_releaseState extends State<Press_release> {
  String? images;
  bool isItemSaved = false;
  PlatformFile? pickedFile;
  PlatformFile? pickedFil;
  Uint8List? fileBytes;
  Uint8List? fileByte;
  final TextEditingController _itemNameController = TextEditingController();

  void clearTextField() {
    _itemNameController.clear();
  }

  Future<String?> selctFile() async {
    try {
      final resulte = await FilePicker.platform.pickFiles();

      if (resulte == null) return images;
      setState(() {
        pickedFil = resulte.files.first;
        fileByte = pickedFil!.bytes;
      });
    } catch (e) {
      // TODO
    }
    return null;
  }

  Future<String?> selctFile1() async {
    try {
      final resulte = await FilePicker.platform.pickFiles();

      if (resulte == null) return images;
      setState(() {
        pickedFile = resulte.files.first;
        fileBytes = pickedFile!.bytes;
      });
    } catch (e) {
      // TODO
    }
    return null;
  }

  String? imageUrl;
  String? imageUrl_1;

  Future<void> _uploadFiles() async {
    try {
      final firabase_storage.Reference ref =
          firabase_storage.FirebaseStorage.instance.ref().child('Dental_News');
      final firabase_storage.Reference refe = firabase_storage
          .FirebaseStorage.instance
          .ref()
          .child('Dental_News/PDF/Press_release');

      final metadata =
          firabase_storage.SettableMetadata(contentType: 'image/jpeg');

      // Upload first image
      final firabase_storage.Reference imageRef = ref.child(pickedFile!.name);
      final firabase_storage.UploadTask uploadTask =
          imageRef.putData(fileBytes!, metadata);
      await uploadTask.whenComplete(() => null);
      imageUrl = await imageRef.getDownloadURL();

      // Upload second image
      final firabase_storage.Reference imageRef_1 = refe.child(pickedFil!.name);
      final firabase_storage.UploadTask uploadTask_1 =
          imageRef_1.putData(fileByte!, metadata);
      await uploadTask_1.whenComplete(() => null);
      imageUrl_1 = await imageRef_1.getDownloadURL();
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      imageUrl = null;
      imageUrl_1 = null;
    }
  }

  saveItem() async {
    setState(() {
      isItemSaved = true;
    });

    await _uploadFiles();

    if (imageUrl != null && imageUrl_1 != null) {
      await FirebaseFirestore.instance.collection('Dental_Press_release').add({
        'name': _itemNameController.text,
        'image': imageUrl,
        'pdf': imageUrl_1,
      });

      showAlert('Save Successful', 'บันทึกสำเร็จ');
    } else {
      if (kDebugMode) {
        print('Failed to upload images');
      }

      showAlert('Upload Failed', 'อัปโหลดรูปภาพไม่สำเร็จ');
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
                  backgroundColor: MaterialStateProperty.all(Color(0xFF4D0886)),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(
            'image/background.jpg',
          ),
        )),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            NavigatorLayout(),
            textfile(),
            Expanded(
              flex: 3,
              child: Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
            'P R E S S  R E L E A S E',
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
            height: height * 0.45,
            decoration: BoxDecoration(
              color: const Color(0xB2FFFFFF),
              borderRadius: BorderRadius.circular(58),
            ),
            child: Padding(
              padding: EdgeInsets.only(
                top: height * 0.05,
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
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: height * 0.05,
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
                                  pickedFil?.name ?? 'image',
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
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: height * 0.05,
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
                                  pickedFile?.name ?? 'image_1',
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: selctFile1,
                        icon: const Icon(
                          Icons.add_photo_alternate,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Center(
                    child: ElevatedButton(
                      onPressed: () async {
                        // ตรวจสอบว่าข้อมูลที่จำเป็นไม่ว่างเปล่าหรือไม่
                        if (_itemNameController.text.isEmpty) {
                          showAlert('Please fill this out.',
                              "กรุณากรอกข้อมูล ถ้าไม่มีให้ใส - ");
                        } else {
                          // เรียกใช้ saveItem() และรอให้เสร็จสิ้นก่อนที่จะเรียกใช้ showAlert()
                          await saveItem();
                          showAlert('Save Successful', "บันทึกสำเร็จ");
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
                      child: const Text('U P L O A D'),
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
