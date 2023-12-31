import 'dart:io';
import 'dart:typed_data';
import 'package:cross_file_image/cross_file_image.dart';
import 'package:flutter/services.dart';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:image_picker/image_picker.dart';

class AddPicture extends StatefulWidget {
  final String email;
  final String password;
  final String username;

  AddPicture({
    Key? key,
    required this.email,
    required this.password,
    required this.username,
  }) : super(key: key);

  @override
  State<AddPicture> createState() => _AddPictureState();
}

class _AddPictureState extends State<AddPicture> {
  XFile? _image;

  void selectImageFromGallery() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      _image = image;
    });
  }

  void selectImageFromCamera() async {
    final image = await ImagePicker().pickImage(source: ImageSource.camera);
    setState(() {
      _image = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 28,
              ),
              const Text(
                'Holbegram',
                style: TextStyle(fontFamily: 'Billabong', fontSize: 50),
              ),
              Image.asset(
                'assets/images/img.png',
                width: 80,
                height: 60,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 28,
                    ),
                    const Text("Hello, John"),
                    const Text("choose imagee from gallery"),
                    const SizedBox(
                      height: 10,
                    ),
                    _image == null
                        ? Image.asset(
                            "assets/images/Sample_User_Icon.png",
                            height: 250,
                            width: 250,
                          )
                        : Container(
                            width: 200,
                            height: 200,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: XFileImage(_image!),
                              ),
                            )),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        IconButton(
                            icon: Icon(Icons.photo_size_select_large_outlined),
                            onPressed: (() => selectImageFromCamera())),
                        IconButton(
                            icon: Icon(Icons.photo_size_select_large_outlined),
                            onPressed: (() => selectImageFromGallery())),
                      ],
                    ),
                    SizedBox(
                      height: 28,
                    ),
                    SizedBox(
                      height: 48,
                      //width: double.infinity,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                            Color.fromARGB(218, 226, 37, 24),
                          ),
                        ),
                        onPressed: () async {},
                        child: Text(
                          'next',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ]),
      ),
    );
  }
}
