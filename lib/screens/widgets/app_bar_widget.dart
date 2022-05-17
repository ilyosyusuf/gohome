import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gohome/core/constants/colors.dart';
import 'package:gohome/core/extensions/context_extension.dart';
import 'package:gohome/screens/home/cubit/home_cubit.dart';

class AppBarWidget extends StatefulWidget {
  const AppBarWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<AppBarWidget> createState() => _AppBarWidgetState();
}

class _AppBarWidgetState extends State<AppBarWidget> {
  String value = "en";
  String? sendv;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(30.0),
      decoration: BoxDecoration(
          image: DecorationImage(
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.5), BlendMode.darken),
              image: const AssetImage('assets/images/mainimg.jpg'),
              fit: BoxFit.cover)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: context.width,
            alignment: Alignment.centerRight,
            child: BlurryContainer(
              child: DropdownButtonHideUnderline(
                child: DropdownButton(
                    elevation: 0,
                    iconSize: 15,
                    icon: SvgPicture.asset('assets/icons/Category.svg'),
                    items: [
                      DropdownMenuItem(
                          value: 'uz',
                          child: Text(
                            "Uz",
                            style: TextStyle(
                                color: ColorConst.kBottomNavigationColor),
                          ),),
                      DropdownMenuItem(
                          value: 'en',
                          child: Text(
                            "En",
                            style: TextStyle(
                                color: ColorConst.kBottomNavigationColor),
                          ),),
                    ],
                    onChanged: (v) async {
                      if (v == 'uz') {
                        context.read<HomeCubit>().changeLocalization(context, 'uz', 'UZ');
                      } else {
                        context.read<HomeCubit>().changeLocalization(context, 'en', 'US');
                      }
                    }),
              ),
              blur: 5,
              width: context.width * 0.17,
              height: context.height * 0.05,
              elevation: 0,
              color: Colors.white.withOpacity(0.1),
              padding: const EdgeInsets.all(8),
              borderRadius: const BorderRadius.all(Radius.circular(5)),
            ),
          ),
          SizedBox(
            height: context.height * 0.03,
          ),
          Text(
            "hiname".tr(),
            style: TextStyle(color: ColorConst.kWhiteColor, fontSize: 25),
          ),
          SizedBox(height: context.height * 0.01),
          Text(
            "findplace".tr(),
            style: TextStyle(
                color: ColorConst.kWhiteColor,
                fontSize: 25,
                fontWeight: FontWeight.w600),
          ),
          SizedBox(height: context.height * 0.025),
          SizedBox(
            height: context.height * 0.06,
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    onChanged: (v) {
                      context.read<HomeCubit>().search(v);
                    },
                    decoration: InputDecoration(
                      hintText: "lookingfor".tr(),
                      hintStyle: const TextStyle(color: Colors.grey),
                      fillColor: Colors.white,
                      filled: true,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(15.0),
                            bottomLeft: Radius.circular(15.0)),
                        borderSide: BorderSide(color: ColorConst.kPrimaryColor),
                      ),
                      border: const OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15.0),
                            bottomLeft: Radius.circular(15.0)),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: context.width * 0.12,
                  height: context.height * 0.06,
                  padding: const EdgeInsets.all(10.0),
                  child: SvgPicture.asset('assets/icons/Filter.svg'),
                  decoration: BoxDecoration(
                      color: ColorConst.kPrimaryColor,
                      borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(15.0),
                          bottomRight: Radius.circular(15.0))),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
