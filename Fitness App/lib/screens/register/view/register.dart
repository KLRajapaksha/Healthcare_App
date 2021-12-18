
import 'package:fitness_app/screens/register/controller/register_controller.dart';
import 'package:fitness_app/util/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterScreen extends GetView<RegisterController> {
  const RegisterScreen({Key? key}) : super(key: key);



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
          errorStyle: const TextStyle(color: ThemeColors.redColor),
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
    return SafeArea(
        child: Scaffold(
          backgroundColor: ThemeColors.whiteColor,
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 50),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                    const Text("to the Registration",textAlign: TextAlign.start,
                      style: TextStyle(fontSize: 36, fontWeight: FontWeight.w900, color: ThemeColors.blackColor),),
                  ],
                ),
                const SizedBox(height: 48),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [

                        Form(
                          key: controller.registerFormKey,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              const Text("Username",textAlign: TextAlign.start,
                                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: ThemeColors.blackColor),),
                              getTextFormField(hint: "Kevin", controller: controller.userNameController, validator: (value){
                                if(value!.isEmpty){
                                  return "Required!";
                                }
                                else{
                                  return null;
                                }
                              }, paddingTop:4.0),
                              const SizedBox(height: 16),
                              const Text("E-mail",textAlign: TextAlign.start,
                                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: ThemeColors.blackColor),),
                              getTextFormField(hint: "user@name.com", controller: controller.emailController, validator: (value){
                                if(value!.isEmpty){
                                  return "Required!";
                                }
                                else{
                                  return null;
                                }
                              }, paddingTop:4.0),
                              const SizedBox(height: 16),
                              const Text("Password",textAlign: TextAlign.start,
                                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: ThemeColors.blackColor),),
                              getTextFormField(hint: "Password", controller: controller.passwordController, obscureText: true, validator: (value){
                                if(value!.isEmpty){
                                  return "Required!";
                                }
                                else if(value.length < 8){
                                  return "Password must be 8 characters long.";
                                }
                                else{
                                  return null;
                                }
                              },paddingTop:4.0),
                              const SizedBox(height: 16),
                              const Text("Confirm",textAlign: TextAlign.start,
                                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: ThemeColors.blackColor),),
                              getTextFormField(hint: "Password", controller: controller.confirmPasswordController, obscureText: true, validator: (value){
                                if(value != null && value!.isEmpty){
                                  return "Required!";
                                }
                                else if(value != controller.passwordController.text){
                                  return "Password mismatched!";
                                }
                                else{
                                  return null;
                                }
                              },paddingTop:4.0),
                            ],
                          ),
                        ),
                        const SizedBox(height: 50),
                        Container(
                          width: double.infinity,
                          height: 50,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                            boxShadow: [
                              BoxShadow(
                                color: ThemeColors.buttonDropShadowColor,
                                spreadRadius: 0,
                                blurRadius: 20,
                                offset: Offset(0, 10), // changes position of shadow
                              ),
                            ],
                          ),
                          child: TextButton(
                            onPressed: () {
                              FocusScope.of(context).unfocus();
                              controller.registerUser();
                            },
                            style: ButtonStyle(
                                elevation: MaterialStateProperty.all(0),
                                shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
                                backgroundColor: MaterialStateProperty.all(ThemeColors.primaryColor),
                                foregroundColor: MaterialStateProperty.all(ThemeColors.whiteColor),
                                textStyle: MaterialStateProperty.all(const TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18,
                                ))
                            ),
                            child: const Text("Register"),
                          ),
                        ),
                        const SizedBox(height: 24),
                        InkWell(
                          onTap: (){
                            Get.offAllNamed("/login");
                          },
                          child: const Text('I already have an account',style: TextStyle(color: ThemeColors.grayColor),),
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
