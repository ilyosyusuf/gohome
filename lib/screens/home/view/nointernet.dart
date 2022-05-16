import 'package:flutter/material.dart';
import 'package:gohome/core/extensions/context_extension.dart';
import 'package:lottie/lottie.dart';

class NoInternetScreen extends StatelessWidget {
  const NoInternetScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          alignment: Alignment.center,
          height: context.height * 0.35,
          child: Lottie.asset('assets/lotties/nointernet.json'),
        ),
      )
    );
  }
}