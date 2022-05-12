import 'package:flutter/material.dart';
import 'package:gohome/routes/my_route.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: '/home',
      onGenerateRoute: MyRoute.instance.onGenerateRoute,
    );
  }
}
