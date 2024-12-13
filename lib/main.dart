import 'package:flutter/material.dart';
import 'package:flutter_application_1/screen/home_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return
        // MultiProvider(
        //   providers: [],
        //   child:
        MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Coktail Random App',
      theme: ThemeData(primaryColor: Colors.blue),
      home: const SafeArea(child: HomeScreen()),
      // ),
    );
  }
}
