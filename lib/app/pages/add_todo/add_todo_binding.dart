import 'package:get/get.dart';
import '../../app.dart';


class AddTodoBinding extends Bindings{
  @override
  void dependencies() {
  Get.put(AddTodoController());
  }
}