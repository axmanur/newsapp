import 'package:flutter/material.dart';

import 'screens/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
        brightness: Brightness.light,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      home: const MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
