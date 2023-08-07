import 'package:get/get.dart';
import 'package:practical_task_02/modules/userDetails/UserDetailController.dart';

class UserDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => UserDetailsController());
  }
}
