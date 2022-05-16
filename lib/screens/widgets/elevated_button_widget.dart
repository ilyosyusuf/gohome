import 'package:flutter/material.dart';
import 'package:gohome/core/constants/colors.dart';

class MyElevatedButton extends StatefulWidget {
  String? text;
  VoidCallback onPressed;
  double? width;
  double? height;

  MyElevatedButton({ Key? key, this.text, required this.onPressed, this.width, this.height  }) : super(key: key);

  @override
  State<MyElevatedButton> createState() => _MyElevatedButtonState();
}

class _MyElevatedButtonState extends State<MyElevatedButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text(widget.text.toString()),
      onPressed: widget.onPressed,
      style: ElevatedButton.styleFrom(primary: ColorConst.kPrimaryColor,fixedSize: Size(widget.width!, widget.height!), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0))),
      
    );
  }
}