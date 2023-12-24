import 'package:back_end/servic/AuthService.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPang extends StatefulWidget {
  const LoginPang({Key? key}) : super(key: key);

  @override
  _LoginPangState createState() => _LoginPangState();
}

class _LoginPangState extends State<LoginPang> {
  //
  String? email, password;
  bool obscurePassword = true;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();
  final Future<FirebaseApp> firebase = Firebase.initializeApp();

  checkFields() {
    final form = formKey.currentState;
    if (form!.validate()) {
      return true;
    } else {
      return false;
    }
  }

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

    RegExp regex = RegExp(pattern);

    if (!regex.hasMatch(value)) {
      return 'Enter Valid Email';
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }

    // ตรวจสอบความยาวของรหัสผ่าน
    if (value.length < 6 || value.length > 20) {
      return 'Password must be between 6 and 20 characters';
    }

    // ตรวจสอบความซับซ้อนของรหัสผ่าน
    // เช่นต้องมีตัวเลข ตัวอักษรใหญ่ ตัวอักษรเล็ก และอักขระพิเศษอย่างน้อย 1 ตัว
    String pattern = r'^';
    RegExp regex = RegExp(pattern);

    if (!regex.hasMatch(value)) {
      return 'Your password is incorrect.';
    }

    return null;
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Color(0xffffffff),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('image/background.jpg'),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 30,
                ),
                Container(
                  //color: Colors.transparent,
                  height: 300,
                  width: 300,
                  child: Image.asset(
                    'image/APP.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  // dentalnewsloginVDP (1:6)
                  margin: const EdgeInsets.fromLTRB(0, 0, 0, 54),
                  child: const Text(
                    'DENTAL NEWS LOGIN',
                    style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.w400,
                      height: 1.2125,
                      color: Color(0xff38023d),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  height: 494,
                  width: 800,
                  child: Column(
                    children: [
                      Container(
                        height: 400,
                        width: 800,
                        decoration: BoxDecoration(
                          color: const Color(0x7cffffff),
                          borderRadius: BorderRadius.circular(58),
                        ),
                        child: Form(
                          key: formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                  margin:
                                      const EdgeInsets.fromLTRB(50, 50, 50, 8),
                                  child: Text(
                                    'EMAIL',
                                    style: GoogleFonts.k2d(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xff38023d)),
                                  )),
                              Container(
                                margin:
                                    const EdgeInsets.fromLTRB(80, 10, 80, 8),
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    prefixIcon: const Icon(Icons.person),
                                    hintText: 'Email',
                                    filled: true,
                                    fillColor: Colors.grey[200],
                                    border: const OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(15)),
                                      borderSide: BorderSide
                                          .none, // เอาตัวเส้นขอบออกเพื่อให้แสดงพื้นหลังสีเต็ม
                                    ),
                                  ),
                                  validator: (value) => value!.isEmpty
                                      ? 'Email is required'
                                      : validateEmail(value.trim()),
                                  onChanged: (value) {
                                    email = value;
                                  },
                                ),
                              ),
                              Container(
                                  margin:
                                      const EdgeInsets.fromLTRB(50, 40, 50, 8),
                                  child: Text(
                                    'PASSWORD',
                                    style: GoogleFonts.k2d(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xff38023d)),
                                  )),
                              Container(
                                margin: const EdgeInsets.fromLTRB(80, 0, 80, 8),
                                child: TextFormField(
                                  controller: passwordController,
                                  obscureText: obscurePassword,
                                  decoration: InputDecoration(
                                    prefixIcon: const Icon(Icons.lock_open),
                                    suffixIcon: IconButton(
                                      onPressed: () {
                                        setState(() {
                                          obscurePassword = !obscurePassword;
                                        });
                                      },
                                      icon: Icon(obscurePassword
                                          ? Icons.visibility
                                          : Icons.visibility_off),
                                    ),
                                    hintText: 'Password',
                                    filled: true,
                                    fillColor: Colors.grey[200],
                                    border: const OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(15)),
                                      borderSide: BorderSide
                                          .none, // เอาตัวเส้นขอบออกเพื่อให้แสดงพื้นหลังสีเต็ม
                                    ),
                                  ),
                                  validator: (value) => value!.isEmpty
                                      ? 'Password is required'
                                      : validatePassword(value.trim()),
                                  onChanged: (value) {
                                    password = value;
                                  },
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Center(
                                child: ElevatedButton(
                                  onPressed: () {
                                    if (checkFields()) {
                                      AuthService().signIn(email, password);
                                    }
                                  },
                                  style: ElevatedButton.styleFrom(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 30, vertical: 10),
                                    backgroundColor: const Color(0xFF56078B),
                                    textStyle: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w400,
                                      height: 1.2125,
                                    ),
                                  ),
                                  child: const Text('LOGIN'),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
