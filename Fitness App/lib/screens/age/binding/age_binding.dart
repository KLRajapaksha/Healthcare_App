
import 'package:fitness_app/screens/age/controller/age_controller.dart';
import 'package:fitness_app/services/api_service_impl.dart';
import 'package:get/get.dart';

class AgeBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(ApiServiceImpl());
    Get.put(AgeController());
  }

}