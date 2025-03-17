import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  File? image;
  bool isImage = false;

  Future<void> _pickImage({required ImageSource source}) async{
      ImagePicker picker = ImagePicker();
      XFile? xFile = await picker.pickImage(source: source);
      if (xFile != null){
        setState(() {
          File? file = File(xFile.path);
          image = file;
          isImage = true;
        });
      }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          child: ElevatedButton(
            onPressed:( () => _pickImage(source: ImageSource.gallery)
          ),
          style: ElevatedButton.styleFrom(
              shape:CircleBorder(),
          ),
            child: SizedBox(
        height: 200,
        width: 200,
        child:CircleAvatar(
          backgroundImage:isImage? FileImage(image!) : null,
          child: isImage? null : Icon(Icons.photo_camera),
        ) ,
    ) ,
      ),
        ),
        Text("Daniel OKPE",
        style: TextStyle(
          fontSize: 20
        ),
        )
      ],
    );
  }
}

