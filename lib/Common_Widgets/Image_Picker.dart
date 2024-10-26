import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../utilits/Common_Colors.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  File? _image;

  Future<void> _pickImage(ImageSource source) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: source);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
    Navigator.pop(context); // Close the bottom sheet after selecting an image
  }

  void _showImagePickerBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                leading: const Icon(Icons.camera),
                title: const Text('Take Photo'),
                onTap: () {
                  setState(() {
                    _pickImage(ImageSource.camera);
                  });
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo),
                title: const Text('Choose from Gallery'),
                onTap: () {
                  setState(() {
                    _pickImage(ImageSource.gallery);
                  });
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InkWell(
        onTap: _showImagePickerBottomSheet,
        child: CircleAvatar(
          radius: 40,
          backgroundColor: white4,
          backgroundImage: _image != null ? FileImage(_image!) : null,
          child: const Icon(
            Icons.person,
            size: 70,
            color: white1,
          ),
        ),
      ),
    );
  }
}

Widget buildImage(String imageUrl,
    {required Radius? border, required BoxFit? fit}) {
  return ClipRRect(
    borderRadius: border == null ? BorderRadius.zero : BorderRadius.all(border),
    child: Image.network(
      imageUrl,
      fit: fit ?? BoxFit.cover,
      loadingBuilder: (BuildContext context, Widget child,
          ImageChunkEvent? loadingProgress) {
        if (loadingProgress == null) {
          return child;
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
      errorBuilder:
          (BuildContext context, Object exception, StackTrace? stackTrace) {
        return const Center(
          child: Icon(
            Icons.error,
            color: Colors.black54,
          ),
        );
      },
    ),
  );
}

//CONTAINER BORDER
Widget borderbuildImage(String imageUrl, {double? border, BoxFit? fit}) {
  return ClipRRect(
    borderRadius: BorderRadius.only(
        topRight: Radius.circular(border ?? 0),
        topLeft: Radius.circular(border ?? 0)),
    child: Image.network(
      imageUrl,
      fit: fit ?? BoxFit.cover,
      loadingBuilder: (BuildContext context, Widget child,
          ImageChunkEvent? loadingProgress) {
        if (loadingProgress == null) {
          return child;
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
      errorBuilder:
          (BuildContext context, Object exception, StackTrace? stackTrace) {
        return const Center(
          child: Icon(
            Icons.error,
            color: Colors.black54,
          ),
        );
      },
    ),
  );
}
