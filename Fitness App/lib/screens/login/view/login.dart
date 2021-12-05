
import 'package:fitness_app/screens/login/controller/login_controller.dart';
import 'package:fitness_app/util/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends GetView<LoginController> {

  final primaryColor = Color(0xFF414B70);
  final whiteColor = Color(0xFFFFFFFF);
  final backgroundGradient = LinearGradient(colors: [Colors.white, Color(0xFFEEEEEC)], begin: Alignment.topCenter, end: Alignment.bottomCenter,);
  final secondaryColor = Color(0xFF8E92A8);
  final borderEnableColor = Color(0xFFF6F6F6);
  final hintTextColor = Color(0xFFB2B5C4);
  final dropshadowColor = Color(0x1A4B4B4B);
  final redColor = Color(0xFFFF6666);

  Widget getTextFormField({required String hint, required TextEditingController controller, required Function validator, double paddingTop = 8.0, bool obscureText = false}){
    return Padding(
      padding: EdgeInsets.only(top: paddingTop),
      child: TextFormField(
        style: const TextStyle(fontSize: 16.0,),
        decoration: InputDecoration(
          fillColor: ThemeColors.inputGrayColor,
          filled: true,
          border: const OutlineInputBorder(borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(
              Radius.circular(12.0),
            ),
          ),
          errorStyle: TextStyle(color: redColor),
          contentPadding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
          hintText: hint,
          hintStyle: const TextStyle(color: ThemeColors.grayColor, fontSize: 14.0),
        ),
        controller: controller,
        validator: (value) {
          return validator(value);
        },
        obscureText: obscureText,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    print("login is build!");
    return SafeArea(
      child: Scaffold(
        backgroundColor: ThemeColors.whiteColor,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 100),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children:  [
                      const Text("Welcome",style: TextStyle(fontSize: 36, fontWeight: FontWeight.w900, color: ThemeColors.blackColor),),
                      const SizedBox(width: 15,),
                      Image.asset(
                        'assets/images/hand.png',
                        height: 53.0,
                        width: 40.0,
                      ),
                    ],
                  ),
                  const Text("log in to continue",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w900, color: ThemeColors.blackColor),),
                ],
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [

                      Form(

                        key: controller.loginFormKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[

                            getTextFormField(hint: "National ID", controller: controller.usernameController, validator: (value){
                              if(value!.isEmpty){
                                return "Required!";
                              }
                              else{
                                return null;
                              }
                            }),
                            getTextFormField(hint: "Password", controller: controller.passwordController, obscureText: true, validator: (value){
                              if(value!.isEmpty){
                                return "Required!";
                              }
                              else{
                                return null;
                              }
                            },paddingTop:16.0),

                            SizedBox(height: 22),
                            Container(
                              width: double.infinity,
                              height: 53,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(8)),
                                boxShadow: [
                                  BoxShadow(
                                    color: dropshadowColor,
                                    spreadRadius: 0,
                                    blurRadius: 20,
                                    offset: Offset(0, 4), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: TextButton(
                                onPressed: () {
                                  FocusScope.of(context).unfocus();
                                  controller.loginUser();
                                },
                                style: ButtonStyle(
                                    elevation: MaterialStateProperty.all(0),
                                    shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
                                    backgroundColor: MaterialStateProperty.all(primaryColor),
                                    foregroundColor: MaterialStateProperty.all(whiteColor),
                                    textStyle: MaterialStateProperty.all(const TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 18,
                                    ))
                                ),
                                child: Text("Login"),
                              ),
                            ),
                            SizedBox(height: 21),
                            Container(
                              child:  InkWell(
                                onTap: (){
                                    controller.forgotPasswordPage();
                                },
                                child: const Text('forgot your password?',style: TextStyle(color: Color(0xFF414B70)),),

                              ),


                            ),
                            SizedBox(height:170 ,),
                            Divider()
                          ],

                        ),


                      ),
                      SizedBox(height: 23,),
                      Text("Dont have an account?", style: TextStyle(color:primaryColor ),),
                      SizedBox(height: 15,),
                      Container(
                        width: double.infinity,
                        height: 53,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          boxShadow: [
                            BoxShadow(
                              color: dropshadowColor,
                              spreadRadius: 0,
                              blurRadius: 20,
                              offset: Offset(0, 4), // changes position of shadow
                            ),
                          ],
                        ),

                        child: TextButton(
                          onPressed: () {
                            Get.offNamed("/register");
                          },
                          style: ButtonStyle(
                              elevation: MaterialStateProperty.all(0),
                              shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
                              backgroundColor: MaterialStateProperty.all(borderEnableColor),
                              foregroundColor: MaterialStateProperty.all(primaryColor),
                              textStyle: MaterialStateProperty.all(TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 18,
                              ))
                          ),


                          child: Text("Register"),

                        ),

                      ),

                    ],


                  ),


                ),


              ),

            ],

          ),
        ),
      ),
    );
  }
}