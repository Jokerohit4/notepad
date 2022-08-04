import 'package:get/get.dart';
import '../../app.dart';


class HomeBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    //Get.put(ApiService());
    Get.put(HomeController());
  }
}