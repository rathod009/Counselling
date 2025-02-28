import 'package:flutter/material.dart';
import 'package:counselling/Screens/welcome.dart';

void main() {
  runApp(CounsellingApp());
}

class CounsellingApp extends StatelessWidget {
  const CounsellingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WelcomeScreen(),
    );
  }
}
