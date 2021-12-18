
import 'package:fitness_app/App/app_state.dart';
import 'package:fitness_app/screens/selectgoal/controller/selectgoal_controller.dart';
import 'package:fitness_app/util/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SelectGoalScreen extends StatefulWidget{
  const SelectGoalScreen({Key? key}) : super(key: key);

  @override
  State<SelectGoalScreen> createState() => _SelectGoalScreenState();
}

class _SelectGoalScreenState extends State<SelectGoalScreen> {
  int _currentValue = 0;
  final AppState appSate = Get.put(AppState());
  final SelectGoalController controller = Get.put(SelectGoalController());

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
              const Text("What's your goal?",style: TextStyle(fontSize: 24, fontWeight: FontWeight.w900, color: ThemeColors.blackColor),),
              const SizedBox(height: 110),
              SizedBox(
                height: 50,
                width: double.infinity,
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      _currentValue = 0;
                    });
                  },
                  style: ButtonStyle(
                      elevation: MaterialStateProperty.all(0),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
                      backgroundColor: MaterialStateProperty.all(_currentValue == 0 ? ThemeColors.primaryColor : ThemeColors.secondaryGrayColor),
                      foregroundColor: MaterialStateProperty.all(_currentValue == 0 ? ThemeColors.whiteColor : ThemeColors.blackColor),
                      textStyle: MaterialStateProperty.all(const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                      ))
                  ),
                  child: Text(appSate.goalList[0] ?? ""),
                ),
              ),
              const SizedBox(height: 24),
              SizedBox(
                height: 50,
                width: double.infinity,
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      _currentValue = 1;
                    });
                  },
                  style: ButtonStyle(
                      elevation: MaterialStateProperty.all(0),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
                      backgroundColor: MaterialStateProperty.all(_currentValue == 1 ? ThemeColors.primaryColor : ThemeColors.secondaryGrayColor),
                      foregroundColor: MaterialStateProperty.all(_currentValue == 1 ?ThemeColors.whiteColor : ThemeColors.blackColor),
                      textStyle: MaterialStateProperty.all(const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                      ))
                  ),
                  child: Text(appSate.goalList[1] ?? ""),
                ),
              ),
              const SizedBox(height: 24),
              SizedBox(
                height: 50,
                width: double.infinity,
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      _currentValue = 2;
                    });
                  },
                  style: ButtonStyle(
                      elevation: MaterialStateProperty.all(0),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
                      backgroundColor: MaterialStateProperty.all(_currentValue == 2 ? ThemeColors.primaryColor : ThemeColors.secondaryGrayColor),
                      foregroundColor: MaterialStateProperty.all(_currentValue == 2 ?ThemeColors.whiteColor : ThemeColors.blackColor),
                      textStyle: MaterialStateProperty.all(const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                      ))
                  ),
                  child: Text(appSate.goalList[2] ?? ""),
                ),
              ),
              const SizedBox(height: 24),
              SizedBox(
                height: 50,
                width: double.infinity,
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      _currentValue = 3;
                    });
                  },
                  style: ButtonStyle(
                      elevation: MaterialStateProperty.all(0),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
                      backgroundColor: MaterialStateProperty.all(_currentValue == 3 ? ThemeColors.primaryColor : ThemeColors.secondaryGrayColor),
                      foregroundColor: MaterialStateProperty.all(_currentValue == 3 ?ThemeColors.whiteColor : ThemeColors.blackColor),
                      textStyle: MaterialStateProperty.all(const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                      ))
                  ),
                  child: Text(appSate.goalList[3] ?? ""),
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
                        child: const Text("PREV", style: TextStyle(
                          fontSize: 17, color: ThemeColors.ageGrayColor
                        ),)
                    ),
                    TextButton(
                        onPressed: (){
                            appSate.selectedGoal = _currentValue;
                            appSate.selectedGoalName = appSate.goalList[_currentValue];
                            controller.updateProfileData(appSate.gender, appSate.age, appSate.height, appSate.weight, appSate.selectedGoalName);
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