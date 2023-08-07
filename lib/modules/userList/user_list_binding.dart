import 'package:get/get.dart';
import 'package:practical_task_02/modules/userList/user_list_controller.dart';

class UserListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => UserListController());
  }
}
