import 'package:back_end/widget/NavigatorLayout.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:firebase_storage/firebase_storage.dart' as firabase_storage;
import 'package:google_fonts/google_fonts.dart';

import '../widget/Articles_about.dart';

class Toothache extends StatefulWidget {
  const Toothache({super.key});

  @override
  State<Toothache> createState() => _ToothacheState();
}

class _ToothacheState extends State<Toothache> {
  String? images;
  bool isItemSaved = false;
  PlatformFile? pickedFile;
  Uint8List? fileBytes;
  final TextEditingController _itemNameController = TextEditingController();
  final TextEditingController _itemDataController = TextEditingController();

  void clearTextField() {
    _itemNameController.clear();
    _itemDataController.clear();
  }

  Future<String?> selctFile() async {
    try {
      final result = await FilePicker.platform.pickFiles();

      if (result == null) return images;
      setState(() {
        pickedFile = result.files.first;
        fileBytes = pickedFile!.bytes;
      });
    } catch (e) {
      // TODO
    }
    return null;
  }

  Future<String> _uploadFile() async {
    String imageUrl = '';
    try {
      firabase_storage.UploadTask
          uploadTask; // กำหนดให้ uploadTask = firabase_storage.UploadTask

      firabase_storage.Reference ref = firabase_storage.FirebaseStorage.instance
          .ref()
          .child('Dental_News/')
          .child('/' + pickedFile!.name);

      final metadata =
          firabase_storage.SettableMetadata(contentType: 'image/jpeg');

      //uploadTask = ref.putFile(File(file.path));
      uploadTask = ref.putData(fileBytes!, metadata);

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
      await FirebaseFirestore.instance.collection('Dental_Toothache').add({
        'name': _itemNameController.text,
        'data': _itemDataController.text,
        'image': imageUrl,
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
            'T O O T H A C H E',
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
                  TextFormField(
                    controller: _itemDataController,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.map),
                      hintText: 'Data',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
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
                                  pickedFile?.name ?? 'image',
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
                          setState(() {
                            pickedFile = null;
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
