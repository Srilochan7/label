import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sizer/sizer.dart';

class TestPage extends StatelessWidget {
  const TestPage({super.key});

  Future<void> _openCamera(BuildContext context) async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.camera);
    if (image != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Image captured: ${image.path}')),
      );
    }
  }

  void _showCameraOverlay(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => Container(
        height: 60.h, // Adjust height for the camera overlay
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Column(
          children: [
            SizedBox(height: 2.h),
            Text(
              'Camera Preview',
              style: TextStyle(color: Colors.white, fontSize: 14.sp),
            ),
            SizedBox(height: 2.h),
            Container(
              width: 80.w, // Adjust width for the "camera" area
              height: 40.h, // Adjust height for the "camera" area
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blueAccent, width: 2),
                borderRadius: BorderRadius.circular(12),
                color: Colors.grey[900], // Simulate the camera preview
              ),
              child: Center(
                child: Icon(Icons.camera_alt, color: Colors.white, size: 10.w),
              ),
            ),
            Spacer(),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // Close overlay
                _openCamera(context); // Trigger actual camera
              },
              child: Text('Capture', style: TextStyle(fontSize: 12.sp)),
            ),
            SizedBox(height: 2.h),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Camera Page', style: TextStyle(fontSize: 15.sp)),
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => _showCameraOverlay(context),
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(
              horizontal: 8.w,
              vertical: 2.h,
            ),
          ),
          child: Text(
            'Open Camera',
            style: TextStyle(fontSize: 12.sp),
          ),
        ),
      ),
    );
  }
}
