import 'package:flutter/material.dart';
import 'package:gohome/screens/home/view/home_page.dart';
import 'package:gohome/screens/home/view/secondpage.dart';
import 'package:gohome/screens/onboarding/onboarding_page.dart';

class MyRoute {
  static final MyRoute _instance = MyRoute._init();
  static MyRoute get instance => _instance;
  MyRoute._init();

  Route? onGenerateRoute(RouteSettings settings) {
    var args = settings.arguments;
    switch (settings.name) {
      case '/home':
        return _pages(HomePage());
      case '/onboarding':
        return _pages(OnBoardingPAge());
      case '/second':
        return _pages(SecondPage());
      default:
    }
  }
    _pages(Widget page){
      return MaterialPageRoute(builder: (context)=> page);
    }

}


  
