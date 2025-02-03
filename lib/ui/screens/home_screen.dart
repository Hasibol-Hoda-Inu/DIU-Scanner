import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/widgets.dart' as p;

class HomeScreen extends StatefulWidget {
  static const String name = "/home-screen";
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List<XFile> _pickedImageList = [];
  List<Uint8List> _pdfImages = [];

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
              onPressed: (){
                makePdf();
              },
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

  Future<void> _loadImagesForPdf() async {
    _pdfImages = [];
    for (var imageFile in _pickedImageList) {
      final bytes = await File(imageFile.path).readAsBytes();
      _pdfImages.add(bytes);
    }
  }

  Future<void>makePdf()async {

    try{
      final ByteData assetData = await rootBundle.load('assets/images/logo.png');
      final Uint8List assetBytes = assetData.buffer.asUint8List();
      await _loadImagesForPdf();

      final pdf = p.Document();
      pdf.addPage(
          p.Page(build: (context){
            return p.Column(
              children: [
                p.Column(
                  crossAxisAlignment: p.CrossAxisAlignment.start,
                  children: [
                    p.Center(
                      child:
                      p.Column(
                        children: [
                          p.Image(p.MemoryImage(assetBytes),
                            width: 200,
                          ),
                          p.Text("Assignment ",
                            style: p.TextStyle(
                                fontWeight: p.FontWeight.bold,
                                fontSize: 26
                            ),
                          ),
                        ],
                      ),
                    ),
                    p.SizedBox(height: 12,),
                    p.Row(
                      children: [
                        p.Text("Assignment Name : ",
                          style: p.TextStyle(
                              fontWeight: p.FontWeight.bold,
                              fontSize: 18
                          ),
                        ),
                        p.Text(_assignmentTEController.text),
                      ],
                    ),
                    p.Row(
                      children: [
                        p.Text("Course Code : ",
                          style: p.TextStyle(
                              fontWeight: p.FontWeight.bold,
                              fontSize: 18
                          ),
                        ),
                        p.Text(_courseCodeTEController.text)
                      ],
                    ),
                    p.Row(
                      children: [
                        p.Text("Course Title : ",
                          style: p.TextStyle(
                              fontWeight: p.FontWeight.bold,
                              fontSize: 18
                          ),
                        ),
                        p.Text(_courseTitleTEController.text)
                      ],
                    ),
                    p.Row(
                      children: [
                        p.Text("Submitted to : ",
                          style: p.TextStyle(
                              fontWeight: p.FontWeight.bold,
                              fontSize: 18
                          ),
                        ),
                        p.Text(_submittedToTEController.text)
                      ],
                    ),
                    p.SizedBox(height:60,),
                    p.Text("Lecturer, Department of CSE ",
                      style: p.TextStyle(
                          fontWeight: p.FontWeight.bold,
                          fontSize: 26
                      ),
                    ),
                    p.Text("Daffodil Internation University",
                      style: p.TextStyle(
                          fontSize: 18
                      ),
                    ),
                    p.SizedBox(height: 36,),
                    p.Row(
                      children: [
                        p.Text("Submitted by : ",
                          style: p.TextStyle(
                              fontWeight: p.FontWeight.bold,
                              fontSize: 18
                          ),
                        ),
                        p.Text(_submittedByTEController.text)
                      ],
                    ),
                    p.Row(
                      children: [
                        p.Text("ID : ",
                          style: p.TextStyle(
                              fontWeight: p.FontWeight.bold,
                              fontSize: 18
                          ),
                        ),
                        p.Text(_idTEController.text)
                      ],
                    ),
                    p.Row(
                      children: [
                        p.Text("Section : ",
                          style: p.TextStyle(
                              fontWeight: p.FontWeight.bold,
                              fontSize: 18
                          ),
                        ),
                        p.Text(_sectionTEController.text)
                      ],
                    ),
                    p.Text("Daffodil Internation University",
                      style: p.TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    p.Row(
                      children: [
                        p.Text("Submission Date : ",
                          style: p.TextStyle(
                              fontWeight: p.FontWeight.bold,
                              fontSize: 18
                          ),
                        ),
                        p.Text(_submissionDateTEController.text)
                      ],
                    ),
                  ],
                ),
              ],
            );
          })
      );

      for(var imageBytes in _pdfImages){
        pdf.addPage(
            p.Page(build: (context){
              return  p.Center(
                child: p.Image(p.MemoryImage(imageBytes), fit: p.BoxFit.contain),
              );
            })
        );
      }


      Directory? root;
      try{
        root = (await getExternalStorageDirectories(type: StorageDirectory.downloads))?.first;
      }catch(e){
        throw Exception("Failed to get storage directory: $e");
      }
      String timestamp = DateTime.now().toIso8601String().replaceAll(":", "-");
      String filePath = "${root?.path}/DIUScanner_$timestamp.pdf";

      final file = File(filePath);
      await file.writeAsBytes(await pdf.save());
      debugPrint("Path : ${filePath}");

      if(mounted){
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.green,
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('PDF created successfully!'),
                Text('Path: $filePath', style: const TextStyle(fontSize: 12)),
              ],
            ),
          ),
        );
      }
    }catch(e){
      debugPrint(e.toString());
      if(mounted){
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.red,
            content: Text('Error: ${e.toString().replaceAll('Exception: ', '')}'),
            duration: const Duration(seconds: 5),
          ),
        );
      }
    }

  }

  void clearTEControllers(){
    _assignmentTEController.clear();
    _courseCodeTEController.clear();
    _courseTitleTEController.clear();
    _submittedToTEController.clear();
    _submittedByTEController.clear();
    _idTEController.clear();
    _sectionTEController.clear();
    _submissionDateTEController.clear();
  }

  @override
  void dispose() {
    _assignmentTEController.dispose();
    _courseCodeTEController.dispose();
    _courseTitleTEController.dispose();
    _submittedToTEController.dispose();
    _submittedByTEController.dispose();
    _idTEController.dispose();
    _sectionTEController.dispose();
    _submissionDateTEController.dispose();
    super.dispose();
  }
}
