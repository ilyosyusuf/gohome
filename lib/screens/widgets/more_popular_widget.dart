import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gohome/core/components/box_full_decoration.dart';
import 'package:gohome/core/components/without_shadow_decoration.dart';
import 'package:gohome/core/constants/colors.dart';
import 'package:gohome/core/extensions/context_extension.dart';

class MorePopularPlacesWidget extends StatelessWidget {
  String image_url;
  String name;
  String location;
  String cost;

  MorePopularPlacesWidget({Key? key, required this.image_url, required this.name, required this.location, required this.cost}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0, top: 15, bottom: 25.0),
      child: Container(
        width: context.width * 0.6,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: context.width * 0.25,
                height: context.height,
                child: ClipRRect(borderRadius: BorderRadius.circular(15.0),child: FadeInImage(fit: BoxFit.cover,placeholder: AssetImage('assets/images/loadingg.gif'), image: NetworkImage(image_url))),
                // decoration: WithoutShadowDecoration.decorate(
                //   Colors.yellow,
                //   image_url,
                // ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  name,
                  style: TextStyle(
                      color: ColorConst.kBottomNavigationColor,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                  overflow: TextOverflow.clip,
                  maxLines: 2,
                ),
                Flexible(
                    child: Text(location,
                        style: const TextStyle(color: Colors.grey, fontSize: 12),
                        overflow: TextOverflow.clip)),
                Row(
                  children: [
                    Text(
                      "$cost\$",
                      style: TextStyle(
                          color: ColorConst.kPrimaryColor, fontSize: 18.0),
                    ),
                    Text(
                      "/" + "night".tr(),
                      style: const TextStyle(color: Colors.grey),
                    )
                  ],
                )
              ],
            )
          ],
        ),
        decoration: BoxAllDecoration.decor(Colors.white),
      ),
    );
  }
}
