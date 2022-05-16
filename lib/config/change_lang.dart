import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ChangeLocale {
    void changeLocalization(BuildContext context,String first, String second){
    context.setLocale(Locale(first, second.toUpperCase()));
  }
}