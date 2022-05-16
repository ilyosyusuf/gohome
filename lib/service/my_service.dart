// import 'dart:convert';

// import 'package:flutter/services.dart' as bundle;
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:gohome/models/home_model.dart';
// import 'package:gohome/screens/home/state/home_state.dart';

// // class MyJsonData {
// //   static Future<List<HomeModel>?> getData() async {
// //     try {
// //       final data =
// //           await bundle.rootBundle.loadString('lib/mock/mock_data.json');
// //       print(data);
// //       final List<HomeModel> list =
// //           (jsonDecode(data) as List).map((e) => HomeModel.fromJson(e)).toList();
// //       print(list[0].homeName);
// //       return list;
// //     } catch (e) {
// //       print(e);
// //     }
// //   }
// // }

// class CartCubit extends Cubit<HomeState>{
//   CartCubit():super(HomeInitial());

//   Future<List<HomeModel>?> getData() async {
//     emit(HomeLoading());
//     try {
//       final data =
//           await bundle.rootBundle.loadString('lib/mock/mock_data.json');
//       print(data);
//       final List<HomeModel> list =
//           (jsonDecode(data) as List).map((e) => HomeModel.fromJson(e)).toList();

//       print(list[0].homeName);
//       emit(HomeComplete(HomeModel: list));
//       // return list;
//     } catch (e) {
//       emit(HomeError());
//     }
//   }
// }


