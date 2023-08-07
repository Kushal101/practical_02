import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practical_task_02/modules/userList/user_list_binding.dart';
import 'package:practical_task_02/modules/userList/user_list_screen.dart';
import 'package:practical_task_02/routes/app_pages.dart';
import 'package:practical_task_02/themes/color_theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeColor().themeData,
      home: UserListScreen(),
      initialBinding: UserListBinding (),
      getPages: AppPages.pages,
    );
  }
}

