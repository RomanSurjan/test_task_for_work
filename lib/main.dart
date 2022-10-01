

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:test_task_for_work/firebase/firebase_options.dart';

import 'package:test_task_for_work/screens/home.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home:StartPage(),
    );
  }
}




