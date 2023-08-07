import 'package:get/get.dart';
import 'package:practical_task_02/modules/UserUpdate/UserUpdateScreen.dart';
import 'package:practical_task_02/modules/userDetails/UserDetailsbinding.dart';
import 'package:practical_task_02/modules/userList/user_list_binding.dart';
import 'package:practical_task_02/modules/userList/user_list_screen.dart';
import '../modules/UserUpdate/UserUpdateBinding.dart';
import '../modules/userDetails/UserDetailsScreen.dart';
import 'app_routes.dart';

class AppPages {
  static final List<GetPage> pages = [
    GetPage(
      name: AppRoutes.userList,
      page: () => UserListScreen(),
      binding: UserListBinding(),
    ),
    GetPage(
      name: AppRoutes.userDetails,
      page: () => UserDetailsScreen(),
      binding: UserDetailBinding(),
    ),
    GetPage(
      name: AppRoutes.userUpdate,
      page: () => UserUpdateScreen(),
      binding: UserUpdateBinding(),
    ),
  ];
}
