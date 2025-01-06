import 'package:flutter/material.dart';
import 'package:label/test/test_ir.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Sizer App',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const TestPage(),
        );
      },
    );
  }
}
