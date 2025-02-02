import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker_task/widgets/image_list_view.dart';
import 'package:image_picker_task/widgets/image_picker_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<File> images = [];

  void addImages(List<File> newImages){
    setState(() {
      images.addAll(newImages);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          'My Gallery',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: ImageListView(images: images),
          ),
          ImagePickerButton(onImagesSelected: addImages),
          SizedBox(height: 20,),
        ],
      ),
    );
  }
}
