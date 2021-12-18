import 'package:dio/dio.dart';
import 'package:fitness_app/services/api_service.dart';
import 'package:fitness_app/services/api_service_impl.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppState extends GetxController{

  String gender = "female";
  int age = 0;
  double height = 0;
  double weight = 0;

  var goalList = ["Lose Weight", "Gain Weight", "Gain Muscle", "Improve Health"];
  int selectedGoal = 0;
  var selectedGoalName = "Lose Weight";



  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }


}