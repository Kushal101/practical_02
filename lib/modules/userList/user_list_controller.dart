import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:practical_task_02/apis/Service.dart';
import 'package:practical_task_02/models/UserList.dart';

class UserListController extends GetxController {
  AppService appService = AppService();
  Rx<TextEditingController> userNameController = TextEditingController().obs;
  Rx<TextEditingController> userIdController = TextEditingController().obs;

  bool isLoading = true;
  List<UserListModel> userData = [];
  Rx<List<UserListModel>> foundUserName = Rx<List<UserListModel>>([]);
  Rx<List<UserListModel>> foundUserId = Rx<List<UserListModel>>([]);

  @override
  void onInit() {
    super.onInit();
    foundUserName.value = userData;
    foundUserId.value = userData;
    fetchUserList();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void filterUserName(String userName) {
    List<UserListModel> results = [];
    if (userName.isEmpty) {
      results = userData;
    } else {
      results = userData.where((element) {
        return element.firstname
            .toString()
            .toLowerCase()
            .contains(userName.toLowerCase());
      }).toList();
    }

    if (results.isNotEmpty) {
      foundUserName.value = results;
    } else {
      Get.back();
      Get.snackbar("Alert!!", "User not found");
    }
  }

  void filterUserId(String userId) {
    List<UserListModel> results = [];
    if (userId.isEmpty) {
      results = userData;
    } else {
      results = userData
          .where((element) => element.id
              .toString()
              .toLowerCase()
              .contains(userId.toLowerCase()))
          .toList();
    }
    foundUserId.value = results;
  }

  void fetchUserList() async {
    var response = await appService.getAllUser();

    if (response != null) {
      response['data'].forEach((data) {
        userData.add(UserListModel.fromMap(data));

        isLoading = false;
        update();
      });
    }
  }
}
