import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gohome/core/components/box_full_decoration.dart';
import 'package:gohome/core/components/box_only_decoration.dart';
import 'package:gohome/core/constants/colors.dart';
import 'package:gohome/core/extensions/context_extension.dart';

class NearPlaceWidget extends StatelessWidget {
  String image_url;
  String name;
  String room;
  String bed;
  String bathroom;
  String cost;
  
  NearPlaceWidget({
    Key? key,
    required this.image_url,
    required this.name,
    required this.room,
    required this.bed,
    required this.bathroom,
    required this.cost,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width * 0.75,
      decoration: BoxAllDecoration.decor(Colors.white),
      child: Column(
        children: [
          Expanded(
              flex: 6,
              child: Container(
                  decoration: BoxOnlyDecoration.top(
                      Colors.yellow,
                      image_url),),),
          Expanded(
            flex: 4,
            child: Container(
              width: context.width,
              padding: const EdgeInsets.only(left: 15.0),
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                mainAxisAlignment:
                    MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                        color: ColorConst
                            .kBottomNavigationColor,
                        fontSize: 20,
                        fontWeight: FontWeight.w600),
                  ),
                  Text(
                    "$room " +
                        "room".tr() +
                        " - $bed " +
                        "bed".tr() +
                        " - $bathroom " +
                        "bathroom".tr() +
                        " - Wi Fi",
                    style: const TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                  Row(
                    children: [
                      Text(
                        "$cost\$",
                        style: TextStyle(
                            color:
                                ColorConst.kPrimaryColor,
                            fontSize: 18.0),
                      ),
                      Text(
                        "/" + "night".tr(),
                        style:
                            TextStyle(color: Colors.grey),
                      )
                    ],
                  )
                ],
              ),
              decoration:
                  BoxOnlyDecoration.bottom(Colors.white),
            ),
          )
        ],
      ),
    );
  }
}