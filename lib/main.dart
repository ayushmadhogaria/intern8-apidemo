import 'package:flutter/material.dart';
import 'package:intern8/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Data from API'),
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 25, 36, 46),
        ),
        body: const HomeScreen(),
      ),
    );
  }
}
