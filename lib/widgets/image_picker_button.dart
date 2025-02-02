import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';


class ImagePickerButton extends StatelessWidget {
  final void Function(List<File>) onImagesSelected;
  const ImagePickerButton({super.key, required this.onImagesSelected});

  Future<void> pickImages() async {
    final ImagePicker picker = ImagePicker();
    try{
      final List<XFile> images = await picker.pickMultiImage();
      if(images.isNotEmpty){
        final files = images.map((image) => File(image.path)).toList();
        onImagesSelected(files);
      }
    } catch(e){
      debugPrint('Error picking images $e');
    }
  }
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: pickImages,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
          child: Text(
            'Pick Images',
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
        )
    );
  }
}
