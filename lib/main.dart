import 'package:flutter/material.dart';
import 'package:rest_api/screens/GetProduct.dart';
import 'package:rest_api/screens/Photos_screens.dart';
import 'package:rest_api/screens/SignUp_screen.dart';
import 'package:rest_api/screens/album_screen.dart';
import 'package:rest_api/screens/upload_image.dart';

import 'screens/last_screen.dart';





void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Rest Api Demo',
      theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),

      home: const UploadImageScreen(),
    );
  }
}



