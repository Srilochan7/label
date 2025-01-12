import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class Splashscreen extends StatelessWidget {
  const Splashscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return Scaffold(
          body: Center(
            child: Text(
              'Splash Screen',
              style: TextStyle(
                fontSize: 24.sp, // Using Sizer for responsive text size
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        );
      },
    );
  }
}
