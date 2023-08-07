import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practical_task_02/modules/userList/user_list_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:practical_task_02/themes/color_theme.dart';

import '../../routes/app_routes.dart';

class UserListScreen extends StatelessWidget {
  UserListScreen();
  RxString userNameValue = ''.obs;
  RxString userIdValue = ''.obs;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserListController>(builder: (controller) {
      return Scaffold(
        backgroundColor: ThemeColor.primaryYellow,
        appBar: AppBar(
          backgroundColor: ThemeColor.gradient1,
          leading: IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {},
          ),
          centerTitle: true,
          title: const Text(
            'UserList',
          ),
          elevation: 0,
          actions: [
            IconButton(
                onPressed: () {
                  Get.defaultDialog(
                          title: "Filter User",
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(
                                height: 20,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 10, right: 10),
                                child: TextField(
                                  controller:
                                      controller.userNameController.value,
                                  decoration: const InputDecoration(
                                      hintText: "User name"),
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 10, right: 10),
                                child: TextField(
                                  controller: controller.userIdController.value,
                                  decoration: const InputDecoration(
                                      hintText: "User Id"),
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  if (controller.userNameController.value.text
                                          .isNotEmpty &&
                                      controller.userIdController.value.text
                                          .isNotEmpty) {
                                    controller.filterUserName(controller
                                        .userNameController.value.text);
                                    controller.filterUserId(
                                        controller.userIdController.value.text);
                                    Get.back();
                                  } else {
                                    Get.back();
                                    Get.snackbar("Alert!!",
                                        "Please fill the required field",
                                        backgroundColor:
                                            ThemeColor.primaryShadowGrey,
                                        colorText: ThemeColor.white);
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                    primary: ThemeColor.primaryBlack,
                                    textStyle: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold)),
                                child: const Text('Search'),
                              ),
                            ],
                          ),
                          radius: 10.0)
                      .whenComplete(() {
                    controller.userNameController.value.clear();
                    controller.userIdController.value.clear();
                  });
                },
                icon: const Icon(
                  Icons.filter_alt_outlined,
                ))
          ],
        ),
        body: controller.isLoading
            ? const Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(15, 25, 15, 10),
                child: Obx(
                  () => ListView.separated(
                    shrinkWrap: true,
                    itemCount: controller.foundUserName.value.length,
                    scrollDirection: Axis.vertical,
                    physics: const ScrollPhysics(),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                          onTap: () {},
                          child: Container(
                              height: Get.height * 0.17,
                              decoration: BoxDecoration(
                                  color: ThemeColor.white,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Row(children: [
                                Container(
                                  margin: EdgeInsets.all(5),
                                  child: ClipRRect(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(12.0)),
                                    child: CachedNetworkImage(
                                      imageUrl:
                                          '${controller.foundUserName.value[index].picture}',
                                      fit: BoxFit.cover,
                                      height: Get.height * 0.15,
                                      width: Get.width * 0.25,
                                      placeholder: (context, url) => Container(
                                        height: 250,
                                        width: 164,
                                        child: Center(
                                          child: CircularProgressIndicator(
                                            color: Colors.blue,
                                          ),
                                        ),
                                      ),
                                      errorWidget: (context, url, error) =>
                                          Icon(Icons.error),
                                    ),
                                  ),
                                ),
                                Padding(
                                    padding: EdgeInsets.only(left: 5),
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            width: Get.width * 0.35,
                                            child: Text(
                                              "${controller.foundUserName.value[index].firstname} ${controller.foundUserName.value[index].lastname}",
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  color: ThemeColor.primaryBlue,
                                                  fontWeight: FontWeight.w700),
                                            ),
                                          ),
                                          Text(
                                            "(ID:${controller.foundUserName.value[index].id})",
                                            style: TextStyle(
                                              fontSize: 10,
                                            ),
                                          ),
                                        ])),
                                Spacer(),
                                Container(
                                  margin: EdgeInsets.only(right: 10),
                                  height: Get.height * 0.031,
                                  width: Get.width * 0.2,
                                  child: ElevatedButton(
                                    child: Text('Profile'),
                                    onPressed: () {
                                      Get.toNamed(AppRoutes.userDetails,
                                          arguments: [
                                            controller
                                                .foundUserName.value[index].id
                                          ]);
                                    },
                                    style: ElevatedButton.styleFrom(
                                        primary: ThemeColor.primaryBlack,
                                        textStyle: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                )
                              ])));
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return const SizedBox(height: 20);
                    },
                  ),
                ),
              ),
        floatingActionButton: FloatingActionButton.small(
          onPressed: () {
            controller.onInit();
          },
          child: const Icon(
            Icons.refresh_outlined,
            color: ThemeColor.white,
          ),
        ),
      );
    });
  }
}
