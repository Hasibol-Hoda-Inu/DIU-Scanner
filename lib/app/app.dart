import 'package:diu_scanner/app/app_theme_data.dart';
import 'package:diu_scanner/ui/screens/choose_template_screen.dart';
import 'package:diu_scanner/ui/screens/home_screen.dart';
import 'package:flutter/material.dart';

import '../ui/screens/splash_screen.dart';

class DiuScanner extends StatelessWidget {
  const DiuScanner({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppThemeData.lightThemeData,
      initialRoute: "/",
      onGenerateRoute: (RouteSettings settings){
        late Widget widget;
        if(settings.name == SplashScreen.name){
          widget = const SplashScreen();
        }else if(settings.name == ChooseTemplateScreen.name){
          widget = const ChooseTemplateScreen();
        }else if(settings.name == HomeScreen.name){
          widget = const HomeScreen();
        }
        return MaterialPageRoute(builder: (context){
          return widget;
        }
        );
      },
    );
  }
}
