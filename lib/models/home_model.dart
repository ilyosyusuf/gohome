// To parse this JSON data, do
//
//     final homeModel = homeModelFromJson(jsonString);

import 'dart:convert';

List<List<HomeModel>> homeModelFromJson(String str) => List<List<HomeModel>>.from(json.decode(str).map((x) => List<HomeModel>.from(x.map((x) => HomeModel.fromJson(x)))));

String homeModelToJson(List<List<HomeModel>> data) => json.encode(List<dynamic>.from(data.map((x) => List<dynamic>.from(x.map((x) => x.toJson())))));

class HomeModel {
    HomeModel({
        this.homeName,
        this.cost,
    });

    String? homeName;
    String? cost;

    factory HomeModel.fromJson(Map<String, dynamic> json) => HomeModel(
        homeName: json["home_name"],
        cost: json["cost"],
    );

    Map<String, dynamic> toJson() => {
        "home_name": homeName,
        "cost": cost,
    };
}

