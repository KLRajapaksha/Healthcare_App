
import 'package:fitness_app/App/app_state.dart';
import 'package:fitness_app/screens/age/controller/age_controller.dart';
import 'package:fitness_app/util/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class HeightScreen extends StatefulWidget{
  const HeightScreen({Key? key}) : super(key: key);

  @override
  State<HeightScreen> createState() => _HeightScreenState();
}

class _HeightScreenState extends State<HeightScreen> {
  double _currentValue = 100;
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
                  Text("How tall are you?",style: TextStyle(fontSize: 24, fontWeight: FontWeight.w900, color: ThemeColors.blackColor),),
                  SizedBox(height: 20,),
                  Text("this is used in getting & personalised results & plans for you",textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 14, color: ThemeColors.grayColor),),
                ],
              ),
              const SizedBox(height: 49),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 70,
                    child: Column(
                      children: [
                        Text(
                          (_currentValue/100).toStringAsFixed(2),textAlign: TextAlign.center,
                          style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 32, color: ThemeColors.blackColor),),
                        const Text("metre",textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 14, color: ThemeColors.grayColor),),
                      ],
                    ),
                  ),
                  const SizedBox(width: 58,),
                  SizedBox(
                    height: 400,
                    width: 40,
                    child: SfSlider.vertical(
                      min: 0.0,
                      max: 145.0,
                      activeColor: ThemeColors.primaryColor,
                      inactiveColor: ThemeColors.ageGrayColor,
                      value: _currentValue,
                      interval: 10,
                      stepSize: 1,
                      showTicks: true,
                      showLabels: false,
                      enableTooltip: true,
                      minorTicksPerInterval: 1,
                      shouldAlwaysShowTooltip: true,
                      onChanged: (dynamic value) {
                        setState(() {
                          _currentValue = value;
                        });
                      },
                    ),
                  ),
                  const SizedBox(width: 48,),
                  SizedBox(
                    width: 70,
                    child: Column(
                      children: [
                        Text(_currentValue.toInt().toString(),textAlign: TextAlign.center,
                          style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 32, color: ThemeColors.blackColor),),
                        const Text("cms",textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 14, color: ThemeColors.grayColor),),
                      ],
                    ),
                  ),
                ],
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
                            appSate.height = _currentValue;
                            Get.toNamed("/selectgoal");
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