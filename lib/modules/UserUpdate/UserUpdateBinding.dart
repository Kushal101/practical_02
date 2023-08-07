import 'package:get/get.dart';
import 'package:practical_task_02/modules/UserUpdate/UserUpdateController.dart';

class UserUpdateBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => UserUpdateController());
  }
}
