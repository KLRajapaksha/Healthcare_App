
import 'package:fitness_app/screens/height/view/height.dart';
import 'package:fitness_app/screens/home/controller/home_controller.dart';
import 'package:fitness_app/screens/homescreen/view/homescreen.dart';
import 'package:fitness_app/screens/weight/view/weight.dart';
import 'package:fitness_app/util/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:fluttericon/maki_icons.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {

  final pages = [
    WeightScreen(),
    HeightScreen(),
    HomeScreenView(),
    HeightScreen(),
    WeightScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        builder: (controller) {
          return SafeArea(
            child: CupertinoTabScaffold(
              tabBar: CupertinoTabBar(
                backgroundColor: ThemeColors.whiteColor,
                activeColor: ThemeColors.primaryColor,
                inactiveColor: ThemeColors.secondaryColor,
                currentIndex: controller.pageIndex,
                onTap: controller.changePageIndex,
                items: [
                        const BottomNavigationBarItem(
                            icon: Icon(FontAwesome5.dumbbell, size: 20,),
                            label: "Workouts"
                        ),
                        const BottomNavigationBarItem(
                            icon: Icon(Maki.fast_food, size: 24,),
                            label: "Diet"
                        ),
                        BottomNavigationBarItem(
                            icon: controller.pageIndex==2? Icon(CupertinoIcons.house_fill, size: 24,) : Icon(CupertinoIcons.home, size: 24,),
                            label: "Home"
                        ),
                        BottomNavigationBarItem(
                            icon: controller.pageIndex==3? Icon(CupertinoIcons.square_list_fill, size: 24) : Icon(CupertinoIcons.square_list, size: 24,),
                            label: "Weight logger"
                        ),
                        BottomNavigationBarItem(
                            icon: controller.pageIndex==4?  Icon(CupertinoIcons.arrowshape_turn_up_right_circle_fill, size: 24) :  Icon(CupertinoIcons.arrowshape_turn_up_right_circle, size: 24,),
                            label: "Socials"
                        ),
                ],
              ),
              tabBuilder: (BuildContext context, int index) {
                    return CupertinoTabView(
                      builder: (context){
                        return CupertinoPageScaffold(child: pages[index]);
                      },
                    );
              },
            ),
          );
        },);
  }
}
