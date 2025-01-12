import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class TestPage extends StatefulWidget {
  const TestPage({super.key});

  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  late CameraController _cameraController;
  late Future<void> _initializeControllerFuture;

  // To store the captured image
  XFile? _capturedImage;

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  Future<void> _initializeCamera() async {
    final cameras = await availableCameras();
    _cameraController = CameraController(
      cameras[0],
      ResolutionPreset.medium,
    );
    _initializeControllerFuture = _cameraController.initialize();
  }

  @override
  void dispose() {
    _cameraController.dispose();
    super.dispose();
  }

  // Show the camera preview in a pop-up
  void _showCameraPopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: FutureBuilder<void>(
            future: _initializeControllerFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return Stack(
                  children: [
                    // Camera preview
                    Container(
                      width: 80.w, // Set width for pop-up
                      height: 40.h, // Set height for pop-up
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: CameraPreview(_cameraController),
                      ),
                    ),
                    // Button to capture the photo
                    Positioned(
                      bottom: 10,
                      left: 35.w,
                      child: IconButton(
                        icon: Icon(
                          Icons.camera_alt,
                          color: Colors.white,
                          size: 30.sp,
                        ),
                        onPressed: () async {
                          try {
                            // Capture image
                            final image = await _cameraController.takePicture();
                            setState(() {
                              _capturedImage = image;
                            });

                            // Show confirmation message
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Image captured: ${image.path}')),
                            );
                          } catch (e) {
                            print("Error capturing image: $e");
                          }
                        },
                      ),
                    ),
                  ],
                );
              } else {
                return Center(child: CircularProgressIndicator());
              }
            },
          ),
        );
      },
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
          onPressed: () => _showCameraPopup(context),
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
