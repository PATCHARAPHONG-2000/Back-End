import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widget/Articles_about.dart';
import '../widget/NavigatorLayout.dart';

class Knowledge_Link extends StatefulWidget {
  const Knowledge_Link({Key? key});

  @override
  State<Knowledge_Link> createState() => _Knowledge_LinkState();
}

class _Knowledge_LinkState extends State<Knowledge_Link> {
  bool isItemSaved = false;
  PlatformFile? pickedFile;
  Uint8List? fileBytes;
  final TextEditingController _itemNameController = TextEditingController();
  final TextEditingController _itemUrlController = TextEditingController();

  void clearTextField() {
    _itemNameController.clear();
    _itemUrlController.clear();
  }

  @override
  void dispose() {
    _itemNameController.dispose();
    _itemUrlController.dispose();
    super.dispose();
  }

  saveItem() async {
    setState(() {
      isItemSaved = true;
    });

    String imageUrl = ''; // อัปโหลดไฟล์ภาพและรับ URL กลับมา

    // ignore: unnecessary_null_comparison
    if (imageUrl != null) {
      await FirebaseFirestore.instance.collection('Dental_Knowledge_Link').add({
        'name': _itemNameController.text,
        'url': _itemUrlController.text,
      });
    } else {
      if (kDebugMode) {
        print('Failed to upload image');
      }
      fileBytes = null; // กำหนดค่าเป็น null เพื่อลบข้อความที่แสดงชื่อไฟล์
      pickedFile = null; // กำหนดค่าเป็น null เพื่อลบข้อความที่แสดงชื่อไฟล์

      setState(() {
        isItemSaved = false;
      });
    }
    clearTextField(); // หลังจากที่กด saveItem แล้วจะลบข้อความที่กรอกลงไป
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
            'K N O W L E D G E  L I N K',
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
            height: height * 0.40,
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
                    height: 50,
                  ),
                  Center(
                    child: ElevatedButton(
                      // onPressed: () {
                      //   saveItem();
                      // },
                      onPressed: () async {
                        // ตรวจสอบว่าข้อมูลที่จำเป็นไม่ว่างเปล่าหรือไม่
                        if (_itemNameController.text.isEmpty ||
                            _itemUrlController.text.isEmpty) {
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
