import 'package:diu_scanner/ui/screens/choose_template_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  static const String name = "/";
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _goToTemplateScreen();
  }
  Future<void> _goToTemplateScreen()async {
    await Future.delayed(Duration(seconds: 3));
    if(mounted){
      Navigator.pushNamedAndRemoveUntil(context, ChooseTemplateScreen.name, (predicate)=>false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(child: Center(child: Text("DIU Scanner", style: Theme.of(context).textTheme.titleLarge))),
          CircularProgressIndicator(),
          const SizedBox(height: 36,)
        ],
      ),
    );
  }
}
