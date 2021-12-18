
import 'package:fitness_app/App/app_state.dart';
import 'package:fitness_app/screens/age/controller/age_controller.dart';
import 'package:fitness_app/util/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class WeightScreen extends StatefulWidget{
  const WeightScreen({Key? key}) : super(key: key);

  @override
  State<WeightScreen> createState() => _WeightScreenState();
}

class _WeightScreenState extends State<WeightScreen> {
  double _currentValue = 50.25;
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
                  Text("How heavy are you?",style: TextStyle(fontSize: 24, fontWeight: FontWeight.w900, color: ThemeColors.blackColor),),
                  SizedBox(height: 20,),
                  Text("this is used in getting & personalised results & plans for you",textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 14, color: ThemeColors.grayColor),),
                ],
              ),
              const SizedBox(height: 120),
              Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset(
                    'assets/images/weightmeter.png',
                    height: 154.0,
                    width: 298.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 104.0),
                    child: Column(
                      children: [
                        Text(_currentValue.toStringAsFixed(2),textAlign: TextAlign.center,
                          style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 80, color: ThemeColors.blackColor),),
                        const Text("kgs",textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 14, color: ThemeColors.grayColor),),
                      ],
                    ),
                  ),
                ]
              ),
              const SizedBox(height: 60),
              SfSlider(
                min: 0.0,
                max: 150.0,
                activeColor: ThemeColors.primaryColor,
                inactiveColor: ThemeColors.ageGrayColor,
                value: _currentValue,
                interval: 10,
                stepSize: 0.01,
                showTicks: false,
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
                            appSate.weight = _currentValue;
                            Get.toNamed("/height");
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