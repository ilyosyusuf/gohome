import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gohome/core/base/base_view.dart';
import 'package:gohome/core/constants/colors.dart';
import 'package:gohome/core/extensions/context_extension.dart';
import 'package:gohome/screens/home/cubit/home_cubit.dart';
import 'package:gohome/screens/home/state/home_state.dart';
import 'package:gohome/screens/widgets/app_bar_widget.dart';
import 'package:gohome/screens/widgets/more_popular_widget.dart';
import 'package:gohome/screens/widgets/near_place_widget.dart';
import 'package:gohome/screens/widgets/text_widget.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseView(
        viewModel: HomePage,
        OnPageBuilder: (context, widget) {
          return BlocProvider(
            create: (context) {
              var cubit = HomeCubit();
              cubit.getData();
              return cubit;
            },
            child: myScaffold(context),
          );
        });
  }

  Scaffold myScaffold(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is HomeComplete) {
            var data1 = state.homeModel![0];
            var data2 = state.homeModel![1];
            // List searchData = ;
            return CustomScrollView(
              slivers: [
                SliverAppBar(
                  // pinned: true,
                  // forceElevated: true,
                  snap: true,
                  floating: true,
                  toolbarHeight: context.height * 0.35,
                  flexibleSpace: AppBarWidget(),
                ),
                SliverToBoxAdapter(
                    child: context
                            .watch<HomeCubit>()
                            .searchList!
                            .toList()
                            .isEmpty
                        ? SizedBox(
                            height: context.height * 0.6,
                            child: Column(
                              children: [
                                viewAll(context, "nearplace"),
                                SizedBox(
                                  width: context.width,
                                  height: context.height * 0.3,
                                  child: ListView.builder(
                                      itemCount: data1.length,
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (context, i) {
                                        return Padding(
                                          padding: const EdgeInsets.only(
                                              left: 25.0,
                                              top: 10.0,
                                              bottom: 25.0),
                                          child: NearPlaceWidget(
                                              image_url: data1[i]['image_url'],
                                              name: data1[i]['name'],
                                              room: data1[i]['room'],
                                              bed: data1[i]['bedroom'],
                                              bathroom: data1[i]['bathroom'],
                                              cost: data1[i]['cost']),
                                        );
                                      }),
                                ),
                                viewAll(context, "most"),
                                SizedBox(
                                  width: context.width,
                                  height: context.height * 0.18,
                                  child: ListView.builder(
                                      itemCount: data2.length,
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (context, i) {
                                        return InkWell(
                                          child: MorePopularPlacesWidget(
                                              image_url: data2[i]['image_url'],
                                              name: data2[i]['name'],
                                              location: data2[i]['location'],
                                              cost: data2[i]['cost']),
                                          onTap: () {
                                            Navigator.pushNamedAndRemoveUntil(
                                                context,
                                                '/second',
                                                (route) => false);
                                          },
                                        );
                                      }),
                                ),
                              ],
                            ),
                          )
                        //: SizedBox(child: Text("${context.watch<HomeCubit>().searchList!.toList()[0]['name']}"),)
                        : SizedBox(
                        height: context.height * 0.6,
                          child: ListView.builder(
                              // scrollDirection: Axis.horizontal,
                              itemCount: context
                                  .watch<HomeCubit>()
                                  .searchList!
                                  .toList()
                                  .length,
                              itemBuilder: (context, i) {
                                return SizedBox(
                                  width: context.width,
                                  height: context.height * 0.3,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 25.0, top: 10.0, bottom: 25.0, right: 25.0),
                                    child: NearPlaceWidget(
                                        image_url: context
                                            .watch<HomeCubit>()
                                            .searchList!
                                            .toList()[i]['image_url'],
                                        name: context
                                            .watch<HomeCubit>()
                                            .searchList!
                                            .toList()[i]['name'],
                                        room: context
                                            .watch<HomeCubit>()
                                            .searchList!
                                            .toList()[i]['room'],
                                        bed: context
                                            .watch<HomeCubit>()
                                            .searchList!
                                            .toList()[i]['bedroom'],
                                        bathroom: context
                                            .watch<HomeCubit>()
                                            .searchList!
                                            .toList()[i]['bathroom'],
                                        cost: context
                                            .watch<HomeCubit>()
                                            .searchList!
                                            .toList()[i]['cost']),
                                  ),
                                );
                              }),
                        ))
              ],
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }

  Container viewAll(BuildContext context, String text) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: SizedBox(
          height: context.height * 0.06,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextWidget.textWidget(
                  text: text.tr(),
                  size: 18.0,
                  fontWeight: FontWeight.w500,
                  color: ColorConst.kBottomNavigationColor),
              TextWidget.textWidget(
                  text: "viewall".tr(),
                  size: 15.0,
                  fontWeight: FontWeight.w500,
                  color: ColorConst.kPrimaryColor),
            ],
          ),
        ),
      ),
    );
  }
}
