import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sticky_note/provider/subject_provider.dart';
import 'package:sticky_note/ui/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SubjectProvider(),
      builder: (context, child) => 
      MaterialApp(
          theme: ThemeData(
          primarySwatch: Colors.pink,
          primaryColor: Colors.pink.shade100
          ),
          home: HomePage(),
      ),
    );
  }
}

