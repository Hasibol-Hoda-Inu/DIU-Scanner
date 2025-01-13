import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class HomeScreen extends StatefulWidget {
  static const String name = "/home-screen";
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<XFile> _pickedImageList = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Screen"),
        actions: [
          IconButton.filledTonal(
              onPressed: _clearImageList,
            icon: Icon(Icons.clear_all))],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          spacing: 12,
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: _pickedImageList.length,
                itemBuilder: (context, index)=>Container(
                  width: double.maxFinite,
                  height: 300,
                  margin: EdgeInsets.symmetric(vertical: 8),
                  decoration: BoxDecoration(
                      image: _pickedImageList.isNotEmpty? DecorationImage(
                          image: FileImage(File(_pickedImageList[index].path)),
                          fit: BoxFit.cover
                      ) : null,
                  ),
                  // child: Text(_pickedImageList[index].name),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: _selectImage,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey.shade200,
                foregroundColor: Colors.black87,
              ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 8,
                  children: [
                    Text("Add image", style: TextStyle(fontSize: 18),),
                    Icon(Icons.add, color: Colors.black87, size: 24,),
                  ],
                ),
            ),
            ElevatedButton(
              onPressed: (){},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
              ),
                child: Text("Export pdf", style: TextStyle(fontSize: 18),),
            ),
          ],
        ),
      ),
    );
  }

  void _clearImageList(){
    _pickedImageList.clear();
    setState(() {});
  }

  Future<void> _selectImage()async {
    ImagePicker _imagePicker = ImagePicker();
    XFile? pickedImage = await _imagePicker.pickImage(source: ImageSource.gallery,);
    if(pickedImage != null){
      _pickedImageList.add(pickedImage);
      setState(() {});
    }
  }

  // List<XFile> _imageContainer(){
  //   List<XFile> imageContainer = [];
  //   for(int i=0; i<_pickedImageList.length; i++){
  //     imageContainer.add(_pickedImageList[index]);
  //   }
  //   return imageContainer;
  // }
}
