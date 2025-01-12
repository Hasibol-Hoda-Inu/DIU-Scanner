import 'package:diu_scanner/ui/screens/home_screen.dart';
import 'package:flutter/material.dart';

class ChooseTemplateScreen extends StatefulWidget {
  static const String name = "/choose-template";
  const ChooseTemplateScreen({super.key});

  @override
  State<ChooseTemplateScreen> createState() => _ChooseTemplateScreenState();
}

class _ChooseTemplateScreenState extends State<ChooseTemplateScreen> {
  List<String> templates = ['template1.pdf', 'template2.pdf'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Choose Template"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 250,
              child: GridView.builder(
                itemCount: templates.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, HomeScreen.name);
                  },
                    child: Card(child: Center(child: Text('Choose template ${index + 1}'))),
              );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
