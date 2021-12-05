
import 'package:fitness_app/screens/register/controller/register_controller.dart';
import 'package:fitness_app/services/api_service_impl.dart';
import 'package:get/get.dart';

class RegisterBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(ApiServiceImpl());
    Get.put(RegisterController());
  }

}