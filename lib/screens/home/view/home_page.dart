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
                viewAll(context, "nearplace"),
                SliverToBoxAdapter(
                  child: SizedBox(
                    width: context.width,
                    height: context.height * 0.3,
                    child: ListView.builder(
                        itemCount: data1.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, i) {
                          return Padding(
                            padding: const EdgeInsets.only(
                                left: 25.0, top: 10.0, bottom: 25.0),
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
                ),
                viewAll(context, "most"),
                SliverToBoxAdapter(
                  child: SizedBox(
                    width: context.width,
                    height: context.height * 0.18,
                    child: ListView.builder(
                        itemCount: data2.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, i) {
                          return MorePopularPlacesWidget(
                              image_url: data2[i]['image_url'],
                              name: data2[i]['name'],
                              location: data2[i]['location'],
                              cost: data2[i]['cost']);
                        }),
                  ),
                ),
              ],
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }

  SliverToBoxAdapter viewAll(BuildContext context, String text) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: SizedBox(
          height: context.height * 0.06,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                text.tr(),
                style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w500,
                    color: ColorConst.kBottomNavigationColor),
              ),
              Text(
                "viewall".tr(),
                style: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.w500,
                    color: ColorConst.kPrimaryColor),
              )
            ],
          ),
        ),
      ),
    );
  }
}
