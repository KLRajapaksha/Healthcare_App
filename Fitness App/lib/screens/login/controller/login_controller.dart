import 'package:dio/dio.dart';
import 'package:fitness_app/services/api_service.dart';
import 'package:fitness_app/services/api_service_impl.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController{
  final loginFormKey = GlobalKey<FormState>();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  final redColor = Color(0xFFFF6666);

  late ApiService _apiservice;

  LoginController(){
    _apiservice = Get.find<ApiServiceImpl>();
    _apiservice.init();
  }
  void forgotPasswordPage(){
    Get.toNamed("/mobile_input");
  }
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    usernameController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  void loginUser() async{

    if(loginFormKey.currentState!.validate()){
      EasyLoading.show(status: "Loading...");

      final response = await _apiservice.postRequest("/user/login", {
        'email': usernameController.text.toLowerCase(),
        'password': passwordController.text,
      }, loginErrorHandler);

      if (response?.statusCode == 200) {
        await _saveMyAuthToken(response?.data['userId']?.toString() ?? "");
        EasyLoading.dismiss();
        Get.offAllNamed("/home");
      }

    }

  }

  _saveMyAuthToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('AuthToken', token);
   // prefs.setString('USER_STATUS', "LOGGED");
  }

  void loginErrorHandler(DioError error){
    if (error.response?.statusCode == 401) {
      EasyLoading.dismiss();
      Get.snackbar("Login Failed", "Your email or password is incorrect.", snackPosition: SnackPosition.BOTTOM, duration: Duration(seconds: 2), colorText: redColor, icon: Icon(CupertinoIcons.exclamationmark_circle_fill, color: redColor), backgroundColor: Colors.white70, overlayColor: Color(0xFF151929).withOpacity(0.4) , overlayBlur: 0.001, isDismissible: true, margin: EdgeInsets.only(left: 5.0, right: 5.0, bottom: 10.0));
      print('${error.response?.statusCode} : ${error.response}');
    } else{
      EasyLoading.dismiss();
      Get.snackbar("Error", "Something went wrong! Please try again.", snackPosition: SnackPosition.BOTTOM, duration: Duration(seconds: 2), colorText: redColor, icon: Icon(CupertinoIcons.clear_circled_solid, color: redColor), backgroundColor: Colors.white70, overlayColor: Color(0xFF151929).withOpacity(0.4) , overlayBlur: 0.001, isDismissible: true, margin: EdgeInsets.only(left: 5.0, right: 5.0, bottom: 10.0));
      print('${error.response?.statusCode} : ${error.response}');
    }
  }

}