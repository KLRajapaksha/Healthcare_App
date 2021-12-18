

import 'package:fitness_app/App/app_state.dart';
import 'package:fitness_app/screens/gender/controller/gender_controller.dart';
import 'package:fitness_app/util/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:numberpicker/numberpicker.dart';

class GenderScreen extends StatefulWidget{
  const GenderScreen({Key? key}) : super(key: key);

  @override
  State<GenderScreen> createState() => _AgeScreenState();
}

class _AgeScreenState extends State<GenderScreen> {
  final GenderController controller = Get.find();
  final AppState appSate = Get.put(AppState());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ThemeColors.whiteColor,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 50),
              const Text("Gender",style: TextStyle(fontSize: 24, fontWeight: FontWeight.w900, color: ThemeColors.blackColor),),
              const SizedBox(height: 100),
              InkWell(
                borderRadius: BorderRadius.circular(100),
                onTap: () {
                  controller.maleBtn.value = false;
                  appSate.gender = "female";
                },
                child: Obx(() => Container(
                  height: 138,
                  width: 138,
                  decoration: BoxDecoration(
                      color: controller.maleBtn.isTrue? ThemeColors.lightGrayColor : ThemeColors.primaryColor,
                      shape: BoxShape.circle
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/women.png',
                        height: 60.0,
                        width: 45.0,
                      ),
                      Text("female", style: TextStyle(
                          fontSize: 14, color: controller.maleBtn.isTrue? ThemeColors.blackColor : ThemeColors.whiteColor
                      ),)
                    ],
                  ),
                )
                ),
              ),
              const SizedBox(height: 56),
              InkWell(
                borderRadius: BorderRadius.circular(100),
                onTap: () {
                  controller.maleBtn.value = true;
                  appSate.gender = "male";
                },
                child: Obx(() => Container(
                  height: 138,
                  width: 138,
                  decoration: BoxDecoration(
                      color: controller.maleBtn.isFalse? ThemeColors.lightGrayColor : ThemeColors.primaryColor,
                      shape: BoxShape.circle
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/men.png',
                        height: 60.0,
                        width: 45.0,
                      ),
                      Text("male", style: TextStyle(
                          fontSize: 14, color: controller.maleBtn.isFalse? ThemeColors.blackColor : ThemeColors.whiteColor
                      ),)
                    ],
                  ),
                )
                ),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                        onPressed: (){
                          Get.back();
                        },
                        child: const Text("", style: TextStyle(
                          fontSize: 17, color: ThemeColors.ageGrayColor
                        ),)
                    ),
                    TextButton(
                        onPressed: (){
                          Get.toNamed("/age");
                        },
                        child: const Text("NEXT", style: TextStyle(
                            fontSize: 17, color: ThemeColors.primaryColor
                        ),)
                    )
                  ],
                ),
              )
            ],

          ),
        ),
      ),
    );
  }
}