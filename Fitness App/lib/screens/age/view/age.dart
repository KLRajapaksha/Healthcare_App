
import 'package:fitness_app/App/app_state.dart';
import 'package:fitness_app/screens/age/controller/age_controller.dart';
import 'package:fitness_app/util/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:numberpicker/numberpicker.dart';

class AgeScreen extends StatefulWidget{
  const AgeScreen({Key? key}) : super(key: key);

  @override
  State<AgeScreen> createState() => _AgeScreenState();
}

class _AgeScreenState extends State<AgeScreen> {
  int _currentValue = 20;
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
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Text("How old are you?",style: TextStyle(fontSize: 24, fontWeight: FontWeight.w900, color: ThemeColors.blackColor),),
                  SizedBox(height: 20,),
                  Text("this is used in getting & personalised results & plans for you",textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 14, color: ThemeColors.grayColor),),
                ],
              ),
              const SizedBox(height: 62),
              NumberPicker(
                value: _currentValue,
                minValue: 18,
                maxValue: 100,
                itemHeight: 80,
                itemCount: 5,
                haptics: true,
                textStyle: const TextStyle(color: ThemeColors.ageGrayColor, fontSize: 25,),
                selectedTextStyle: const TextStyle(color: ThemeColors.whiteColor, fontSize: 32),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: ThemeColors.primaryColor),
                  color: ThemeColors.primaryColor
                ),
                onChanged: (value) => setState(() => _currentValue = value),
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
                            appSate.age = _currentValue;
                            Get.toNamed("/weight");
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