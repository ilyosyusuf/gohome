import 'package:flutter/material.dart';

class BoxOnlyDecoration {
  static top(Color color, String image_url) => BoxDecoration(
      color: color,
      image: DecorationImage(image: NetworkImage(image_url), fit: BoxFit.cover),
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0)));
    
    static bottom(Color color) => BoxDecoration(
      color: color,
      borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20.0), bottomRight: Radius.circular(20.0)));
}
