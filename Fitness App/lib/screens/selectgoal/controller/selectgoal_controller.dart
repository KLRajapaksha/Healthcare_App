import 'package:dio/dio.dart';
import 'package:fitness_app/services/api_service.dart';
import 'package:fitness_app/services/api_service_impl.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SelectGoalController extends GetxController{

  final redColor = Color(0xFFFF6666);

  late ApiService _apiservice;

  SelectGoalController() {
    _apiservice = Get.find<ApiServiceImpl>();
    _apiservice.init();
  }

  void updateProfileData(String gender, int age, double height, double weight, String selectedGoal) async {

    EasyLoading.show(status: "Loading...");

    final response = await _apiservice.postRequest("/user/addUserProfileData", {
      "fullname": "",
      "age": age,
      "height": height.toString(),
      "weight": weight.toString(),
      "goal": selectedGoal,
      "gender": gender,
    }, errorHandler);

    if (response?.statusCode == 200) {
      await _saveStatus();
      EasyLoading.dismiss();
      Get.offAllNamed("/home");
    }

  }

  _saveStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('USER_STATUS', "PROFILE_ADDED");
  }

  void errorHandler(DioError error){
    EasyLoading.dismiss();
    Get.snackbar("Error", "Something went wrong! Please try again.", snackPosition: SnackPosition.BOTTOM, duration: Duration(seconds: 2), colorText: redColor, icon: Icon(CupertinoIcons.clear_circled_solid, color: redColor), backgroundColor: Colors.white70, overlayColor: Color(0xFF151929).withOpacity(0.4) , overlayBlur: 0.001, isDismissible: true, margin: EdgeInsets.only(left: 5.0, right: 5.0, bottom: 10.0));
    print('${error.response?.statusCode} : ${error.response}');
  }

}