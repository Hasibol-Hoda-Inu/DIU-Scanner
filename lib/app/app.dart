import 'package:flutter/material.dart';

import '../ui/screens/splash_screen.dart';

class DiuScanner extends StatelessWidget {
  const DiuScanner({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/",
      onGenerateRoute: (RouteSettings settings){
        late Widget widget;
        if(settings.name == SplashScreen.name){
          widget = const SplashScreen();
        }
        return MaterialPageRoute(builder: (context){
          return widget;
        }
        );
      },
    );
  }
}
