import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../routes/app_routes.dart';
import '../../themes/color_theme.dart';
import 'UserDetailController.dart';

class UserDetailsScreen extends StatelessWidget {
  DateTime now = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserDetailsController>(
      builder: (controller) => Scaffold(
        backgroundColor: ThemeColor.white,
        body: controller.isLoading
            ? const Center(child: CircularProgressIndicator())
            : NestedScrollView(
                headerSliverBuilder:
                    ((BuildContext context, bool innerBoxIsScrolled) {
                  return <Widget>[
                    SliverAppBar(
                      title: Text(
                        "${controller.userDetailList[0].firstname} ${controller.userDetailList[0].lastname}",
                        style: TextStyle(
                            fontSize: 20,
                            color: ThemeColor.white,
                            fontWeight: FontWeight.bold),
                      ),
                      expandedHeight: Get.height / 1.8,
                      floating: true,
                      pinned: true,
                      elevation: 0,
                      flexibleSpace: FlexibleSpaceBar(
                        background: Stack(
                          children: [
                            CachedNetworkImage(
                              imageUrl:
                                  '${controller.userDetailList[0].picture}',
                              fit: BoxFit.fill,
                              width: Get.width,
                              height: Get.height,
                            ),
                            Positioned(
                              bottom: 0,
                              left: 0,
                              right: 0,
                              child: Container(
                                height: 200,
                                decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                        begin: Alignment.bottomCenter,
                                        end: Alignment.topCenter,
                                        colors: [
                                      Colors.black.withOpacity(0.7),
                                      Colors.transparent
                                    ])),
                              ),
                            ),
                          ],
                        ),
                        collapseMode: CollapseMode.parallax,
                      ),
                    )
                  ];
                }),
                body: SingleChildScrollView(
                  padding: const EdgeInsets.fromLTRB(30, 20, 30, 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.topRight,
                        child: ElevatedButton(
                          onPressed: () {
                            Get.toNamed(AppRoutes.userUpdate,
                                arguments: [controller.userDetailList[0].id]);
                          },
                          style: ElevatedButton.styleFrom(
                              primary: ThemeColor.primaryBlack,
                              textStyle: const TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold)),
                          child: const Text('Edit'),
                        ),
                      ),
                      Text('Info',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 20),
                      Text(
                        "Gender: ${controller.userDetailList[0].gender}",
                        style: TextStyle(color: ThemeColor.primaryGrey),
                      ),
                      Text(
                          "Date of Birth: ${DateFormat("yyyy-MM-dd").parse(controller.userDetailList[0].dateOfBirth!)}",
                          style: TextStyle(color: ThemeColor.primaryGrey),
                          textAlign: TextAlign.justify),
                      Text("Email: ${controller.userDetailList[0].email}",
                          style: TextStyle(color: ThemeColor.primaryGrey),
                          textAlign: TextAlign.justify),
                      Text("Phone: ${controller.userDetailList[0].phone}",
                          style: TextStyle(color: ThemeColor.primaryGrey),
                          textAlign: TextAlign.justify),
                      Text(
                          "Address: ${controller.userDetailList[0].street}, ${controller.userDetailList[0].city},  ${controller.userDetailList[0].state},  ${controller.userDetailList[0].country}",
                          style: TextStyle(color: ThemeColor.primaryGrey),
                          textAlign: TextAlign.justify),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
