import 'package:gohome/models/home_model.dart';

abstract class HomeState{
 HomeState();
}

class HomeInitial extends HomeState{
  HomeInitial();
}

class HomeLoading extends HomeState{
  HomeLoading();
}

class HomeComplete extends HomeState{
  List? homeModel;
  HomeComplete({required this.homeModel});
}

class HomeError extends HomeState{
  String errorMessage;
  HomeError({required this.errorMessage});
}

class HomeChangeLocal extends HomeState{
  String first;
  String second;
  HomeChangeLocal({required this.first, required this.second});
}