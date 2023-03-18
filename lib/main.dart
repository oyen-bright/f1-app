import 'package:f1_app/navigation/bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'F1',
      theme: ThemeData(
          useMaterial3: true, textTheme: GoogleFonts.secularOneTextTheme()),
      home: const ButtomNavigation(),
    );
  }
}
