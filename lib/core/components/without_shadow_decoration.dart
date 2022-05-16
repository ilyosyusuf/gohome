import 'package:flutter/material.dart';

class WithoutShadowDecoration {
  static decorate(Color color, String image_url) => BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(20.0),
      image: DecorationImage(
        fit: BoxFit.cover,
        image: NetworkImage(image_url))
      );
}