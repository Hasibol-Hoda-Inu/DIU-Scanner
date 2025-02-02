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
  final TextEditingController _assignmentTEController = TextEditingController();
  final TextEditingController _courseCodeTEController = TextEditingController();
  final TextEditingController _courseTitleTEController = TextEditingController();
  final TextEditingController _submittedToTEController = TextEditingController();
  final TextEditingController _submittedByTEController = TextEditingController();
  final TextEditingController _idTEController = TextEditingController();
  final TextEditingController _sectionTEController = TextEditingController();
  final TextEditingController _submissionDateTEController = TextEditingController();

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
              child: SingleChildScrollView(
                child: Column(
                  spacing: 12,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 4,
                      children: [
                        Center(
                          child:
                          Column(
                            spacing: 26,
                            children: [
                              Image.asset("assets/images/logo.png", width: 220,),
                              Text("Assignment",
                                style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 26
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 12,),
                        Row(
                          spacing: 6,
                          children: [
                            Text("Assignment Name :",
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 18
                              ),
                            ),
                            Expanded(
                              child: TextFormField(
                                controller: _assignmentTEController,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  fillColor: Colors.grey.shade200,
                                  filled: true,

                                ),
                              ),
                            )
                          ],
                        ),
                        Row(
                          spacing: 6,
                          children: [
                            Text("Course Code :",
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 18
                              ),
                            ),
                            Expanded(
                              child: TextFormField(
                                controller: _courseCodeTEController,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  fillColor: Colors.grey.shade200,
                                  filled: true,
                                ),
                              ),
                            )
                          ],
                        ),
                        Row(
                          spacing: 6,
                          children: [
                            Text("Course Title :",
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 18
                              ),
                            ),
                            Expanded(
                              child: TextFormField(
                                controller: _courseTitleTEController,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  fillColor: Colors.grey.shade200,
                                  filled: true,
                                ),
                              ),
                            )
                          ],
                        ),
                        Row(
                          spacing: 6,
                          children: [
                            Text("Submitted to :",
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 18
                              ),
                            ),
                            Expanded(
                              child: TextFormField(
                                controller: _submittedToTEController,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  fillColor: Colors.grey.shade200,
                                  filled: true,
                                ),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height:60,),
                        Text("Lecturer, Department of CSE",
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 26
                          ),
                        ),
                        Text("Daffodil Internation University",
                          style: TextStyle(
                              fontSize: 18
                          ),
                        ),
                        const SizedBox(height: 36,),
                        Row(
                          spacing: 6,
                          children: [
                            Text("Submitted by :",
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 18
                              ),
                            ),
                            Expanded(
                              child: TextFormField(
                                controller: _submittedByTEController,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  fillColor: Colors.grey.shade200,
                                  filled: true,

                                ),
                              ),
                            )
                          ],
                        ),
                        Row(
                          spacing: 6,
                          children: [
                            Text("ID :",
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 18
                              ),
                            ),
                            Expanded(
                              child: TextFormField(
                                controller: _idTEController,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  fillColor: Colors.grey.shade200,
                                  filled: true,
                                ),
                              ),
                            )
                          ],
                        ),
                        Row(
                          spacing: 6,
                          children: [
                            Text("Section :",
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 18
                              ),
                            ),
                            Expanded(
                              child: TextFormField(
                                controller: _sectionTEController,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  fillColor: Colors.grey.shade200,
                                  filled: true,
                                ),
                              ),
                            )
                          ],
                        ),
                        Text("Daffodil Internation University",
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        Row(
                          spacing: 6,
                          children: [
                            Text("Submission Date :",
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 18
                              ),
                            ),
                            Expanded(
                              child: TextFormField(
                                controller: _submissionDateTEController,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  fillColor: Colors.grey.shade200,
                                  filled: true,
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
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
                  ],
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
}
