import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gohome/screens/home/state/home_state.dart';
import 'dart:convert';

import 'package:flutter/services.dart' as bundle;

class HomeCubit extends Cubit<HomeState>{
  HomeCubit():super(HomeInitial());


  static List? globalList;
  Future<List>? getData() async {
    emit(HomeLoading());
    try {
      final data =
          await bundle.rootBundle.loadString('lib/mock/mock_data.json');
      print(data);
      final list = jsonDecode(data) as List;
      print(list.toString());

      emit(HomeComplete(homeModel: list));
      globalList = list;
      return list;
      
    } catch (e) {
      emit(HomeError(errorMessage: "Ma'lumot kelishida xatolik"));
      return [];
    }
  }

  void changeLocalization(BuildContext context,String first, String second){
    context.setLocale(Locale(first, second.toUpperCase()));
    emit(HomeChangeLocal(first: first, second: second.toUpperCase()));
    emit(HomeComplete(homeModel: globalList));
  }
}