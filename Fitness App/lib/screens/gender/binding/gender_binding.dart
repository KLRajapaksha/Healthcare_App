
import 'package:fitness_app/screens/gender/controller/gender_controller.dart';
import 'package:fitness_app/services/api_service_impl.dart';
import 'package:get/get.dart';

class GenderBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(ApiServiceImpl());
    Get.put(GenderController());
  }

}