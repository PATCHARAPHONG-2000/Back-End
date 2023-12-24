import 'package:back_end/servic/AuthService.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyCyM_bWS4ez_eH3yS49s62K5mfndXOx0Gw",
      appId: "1:746041165202:web:b9e0df7a4f319b467e6d4b",
      authDomain: "dentalnews-657c1.firebaseapp.com",
      messagingSenderId: "746041165202",
      projectId: "dentalnews-657c1",
      storageBucket: "dentalnews-657c1.appspot.com",
      measurementId: "G-MCD3NCEGY6",
    ),
  );
  runApp(
    MyApp(),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isLoggedIn = false;

  void login() {
    setState(() {
      isLoggedIn = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AuthService().handleAuth(),
    );
  }
}
