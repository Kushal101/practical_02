import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practical_task_02/modules/UserUpdate/UserUpdateController.dart';
import 'package:practical_task_02/modules/userDetails/UserDetailController.dart';
import 'package:practical_task_02/modules/userDetails/UserDetailsScreen.dart';
import 'package:practical_task_02/themes/color_theme.dart';

import '../../routes/app_routes.dart';

class UserUpdateScreen extends StatelessWidget {
  UserUpdateScreen();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserUpdateController>(builder: (controller) {
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
              'UserDetailsUpdate',
            ),
            elevation: 0,
          ),
          body: controller.userDetailList.length < 0
              ? const Center(child: CircularProgressIndicator())
              : SingleChildScrollView(
                  padding: const EdgeInsets.fromLTRB(15, 25, 15, 10),
                  child: Obx(() => Column(children: [
                        Form(
                          key: controller.firstNameKey,
                          child: Container(
                            margin: EdgeInsets.only(top: 30),
                            height: 80,
                            width: 400,
                            child: TextFormField(
                              controller: controller.firstName.value,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "field required";
                                }
                                return null;
                              },
                              keyboardType: TextInputType.text,
                              textInputAction: TextInputAction.done,
                              style: Theme.of(context).textTheme.bodyText1,
                              decoration: InputDecoration(
                                fillColor: Theme.of(context).canvasColor,
                                filled: true,
                                errorStyle:
                                    Theme.of(context).textTheme.labelMedium,
                                helperText: " ",
                                border: const OutlineInputBorder(),
                                labelText: 'First name',
                                labelStyle: Theme.of(context).textTheme.caption,
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 15),
                                enabled: true,
                              ),
                              onChanged: (value) {
                                // value=UserProfile.FirstName;
                              },
                            ),
                          ),
                        ),
                        Form(
                          key: controller.lastNameKey,
                          child: Container(
                            margin: EdgeInsets.only(top: 10),
                            height: 80,
                            width: 400,
                            child: TextFormField(
                              controller: controller.lastName.value,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "field required";
                                }
                                return null;
                              },
                              keyboardType: TextInputType.text,
                              textInputAction: TextInputAction.done,
                              style: Theme.of(context).textTheme.bodyText1,
                              decoration: InputDecoration(
                                fillColor: Theme.of(context).canvasColor,
                                filled: true,
                                errorStyle:
                                    Theme.of(context).textTheme.labelMedium,
                                helperText: " ",
                                border: const OutlineInputBorder(),
                                labelText: 'Last name',
                                labelStyle: Theme.of(context).textTheme.caption,
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 15),
                                enabled: true,
                              ),
                              onChanged: (value) {
                                // value=UserProfile.FirstName;
                              },
                            ),
                          ),
                        ),
                        Form(
                          key: controller.pictureKey,
                          child: Container(
                            margin: EdgeInsets.only(top: 10),
                            height: 80,
                            width: 400,
                            child: TextFormField(
                              controller: controller.picture.value,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "field required";
                                }
                                return null;
                              },
                              keyboardType: TextInputType.text,
                              textInputAction: TextInputAction.done,
                              style: Theme.of(context).textTheme.bodyText1,
                              decoration: InputDecoration(
                                fillColor: Theme.of(context).canvasColor,
                                filled: true,
                                errorStyle:
                                    Theme.of(context).textTheme.labelMedium,
                                helperText: " ",
                                border: const OutlineInputBorder(),
                                labelText: 'Image',
                                labelStyle: Theme.of(context).textTheme.caption,
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 15),
                                enabled: true,
                              ),
                              onChanged: (value) {
                                // value=UserProfile.FirstName;
                              },
                            ),
                          ),
                        ),
                        Form(
                          key: controller.genderKey,
                          child: Container(
                            margin: EdgeInsets.only(top: 10),
                            height: 80,
                            width: 400,
                            child: TextFormField(
                              controller: controller.gender.value,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "field required";
                                }
                                return null;
                              },
                              keyboardType: TextInputType.text,
                              textInputAction: TextInputAction.done,
                              style: Theme.of(context).textTheme.bodyText1,
                              decoration: InputDecoration(
                                fillColor: Theme.of(context).canvasColor,
                                filled: true,
                                errorStyle:
                                    Theme.of(context).textTheme.labelMedium,
                                helperText: " ",
                                border: const OutlineInputBorder(),
                                labelText: 'gender',
                                labelStyle: Theme.of(context).textTheme.caption,
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 15),
                                enabled: true,
                              ),
                              onChanged: (value) {
                                // value=UserProfile.FirstName;
                              },
                            ),
                          ),
                        ),
                        Form(
                          key: controller.emailKey,
                          child: Container(
                            margin: EdgeInsets.only(top: 10),
                            height: 80,
                            width: 400,
                            child: TextFormField(
                              controller: controller.email.value,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "field required";
                                }
                                return null;
                              },
                              keyboardType: TextInputType.text,
                              textInputAction: TextInputAction.done,
                              style: Theme.of(context).textTheme.bodyText1,
                              decoration: InputDecoration(
                                fillColor: Theme.of(context).canvasColor,
                                filled: true,
                                errorStyle:
                                    Theme.of(context).textTheme.labelMedium,
                                helperText: " ",
                                border: const OutlineInputBorder(),
                                labelText: 'email',
                                labelStyle: Theme.of(context).textTheme.caption,
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 15),
                                enabled: true,
                              ),
                              onChanged: (value) {
                                // value=UserProfile.FirstName;
                              },
                            ),
                          ),
                        ),
                        Form(
                          key: controller.phoneKey,
                          child: Container(
                            margin: EdgeInsets.only(top: 10),
                            height: 80,
                            width: 400,
                            child: TextFormField(
                              controller: controller.phone.value,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "field required";
                                }
                                return null;
                              },
                              keyboardType: TextInputType.text,
                              textInputAction: TextInputAction.done,
                              style: Theme.of(context).textTheme.bodyText1,
                              decoration: InputDecoration(
                                fillColor: Theme.of(context).canvasColor,
                                filled: true,
                                errorStyle:
                                    Theme.of(context).textTheme.labelMedium,
                                helperText: " ",
                                border: const OutlineInputBorder(),
                                labelText: 'Contact',
                                labelStyle: Theme.of(context).textTheme.caption,
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 15),
                                enabled: true,
                              ),
                              onChanged: (value) {
                                // value=UserProfile.FirstName;
                              },
                            ),
                          ),
                        ),
                        Form(
                          key: controller.streetKey,
                          child: Container(
                            margin: EdgeInsets.only(top: 10),
                            height: 80,
                            width: 400,
                            child: TextFormField(
                              controller: controller.street.value,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "field required";
                                }
                                return null;
                              },
                              keyboardType: TextInputType.text,
                              textInputAction: TextInputAction.done,
                              style: Theme.of(context).textTheme.bodyText1,
                              decoration: InputDecoration(
                                fillColor: Theme.of(context).canvasColor,
                                filled: true,
                                errorStyle:
                                    Theme.of(context).textTheme.labelMedium,
                                helperText: " ",
                                border: const OutlineInputBorder(),
                                labelText: 'Street',
                                labelStyle: Theme.of(context).textTheme.caption,
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 15),
                                enabled: true,
                              ),
                              onChanged: (value) {
                                // value=UserProfile.FirstName;
                              },
                            ),
                          ),
                        ),
                        Form(
                          key: controller.dateOfBirthKey,
                          child: Container(
                            margin: EdgeInsets.only(top: 10),
                            height: 80,
                            width: 400,
                            child: TextFormField(
                              controller: controller.dateOfBirth.value,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "field required";
                                }
                                return null;
                              },
                              keyboardType: TextInputType.text,
                              textInputAction: TextInputAction.done,
                              style: Theme.of(context).textTheme.bodyText1,
                              decoration: InputDecoration(
                                fillColor: Theme.of(context).canvasColor,
                                filled: true,
                                errorStyle:
                                    Theme.of(context).textTheme.labelMedium,
                                helperText: " ",
                                border: const OutlineInputBorder(),
                                labelText: 'DOB',
                                labelStyle: Theme.of(context).textTheme.caption,
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 15),
                                enabled: true,
                              ),
                              onChanged: (value) {
                                // value=UserProfile.FirstName;
                              },
                            ),
                          ),
                        ),
                        Form(
                          key: controller.cityKey,
                          child: Container(
                            margin: EdgeInsets.only(top: 10),
                            height: 80,
                            width: 400,
                            child: TextFormField(
                              controller: controller.city.value,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "field required";
                                }
                                return null;
                              },
                              keyboardType: TextInputType.text,
                              textInputAction: TextInputAction.done,
                              style: Theme.of(context).textTheme.bodyText1,
                              decoration: InputDecoration(
                                fillColor: Theme.of(context).canvasColor,
                                filled: true,
                                errorStyle:
                                    Theme.of(context).textTheme.labelMedium,
                                helperText: " ",
                                border: const OutlineInputBorder(),
                                labelText: 'City',
                                labelStyle: Theme.of(context).textTheme.caption,
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 15),
                                enabled: true,
                              ),
                              onChanged: (value) {
                                // value=UserProfile.FirstName;
                              },
                            ),
                          ),
                        ),
                        Form(
                          key: controller.stateKey,
                          child: Container(
                            margin: EdgeInsets.only(top: 10),
                            height: 80,
                            width: 400,
                            child: TextFormField(
                              controller: controller.state.value,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "field required";
                                }
                                return null;
                              },
                              keyboardType: TextInputType.text,
                              textInputAction: TextInputAction.done,
                              style: Theme.of(context).textTheme.bodyText1,
                              decoration: InputDecoration(
                                fillColor: Theme.of(context).canvasColor,
                                filled: true,
                                helperText: " ",
                                border: const OutlineInputBorder(),
                                labelText: 'State',
                                labelStyle: Theme.of(context).textTheme.caption,
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 15),
                                enabled: true,
                              ),
                              onChanged: (value) {
                                // value=UserProfile.FirstName;
                              },
                            ),
                          ),
                        ),
                        Form(
                          key: controller.countryKey,
                          child: Container(
                            margin: EdgeInsets.only(top: 10),
                            height: 80,
                            width: 400,
                            child: TextFormField(
                              controller: controller.country.value,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "field required";
                                }
                                return null;
                              },
                              keyboardType: TextInputType.text,
                              textInputAction: TextInputAction.done,
                              style: Theme.of(context).textTheme.bodyText1,
                              decoration: InputDecoration(
                                fillColor: Theme.of(context).canvasColor,
                                filled: true,
                                errorStyle:
                                    Theme.of(context).textTheme.labelMedium,
                                helperText: " ",
                                border: const OutlineInputBorder(),
                                labelText: 'Country',
                                labelStyle: Theme.of(context).textTheme.caption,
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 15),
                                enabled: true,
                              ),
                              onChanged: (value) {
                                // value=UserProfile.FirstName;
                              },
                            ),
                          ),
                        ),
                        Form(
                          key: controller.timezoneKey,
                          child: Container(
                            margin: EdgeInsets.only(top: 10),
                            height: 80,
                            width: 400,
                            child: TextFormField(
                              controller: controller.timezone.value,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "field required";
                                }
                                return null;
                              },
                              keyboardType: TextInputType.text,
                              textInputAction: TextInputAction.done,
                              style: Theme.of(context).textTheme.bodyText1,
                              decoration: InputDecoration(
                                fillColor: Theme.of(context).canvasColor,
                                filled: true,
                                errorStyle:
                                    Theme.of(context).textTheme.labelMedium,
                                helperText: " ",
                                border: const OutlineInputBorder(),
                                labelText: 'TimeZone',
                                labelStyle: Theme.of(context).textTheme.caption,
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 15),
                                enabled: true,
                              ),
                              onChanged: (value) {
                                // value=UserProfile.FirstName;
                              },
                            ),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            if (controller.firstNameKey.currentState!
                                    .validate() &&
                                controller.lastNameKey.currentState!
                                    .validate() &&
                                controller.pictureKey.currentState!
                                    .validate() &&
                                controller.genderKey.currentState!.validate() &&
                                controller.emailKey.currentState!.validate() &&
                                controller.phoneKey.currentState!.validate() &&
                                controller.streetKey.currentState!.validate() &&
                                controller.dateOfBirthKey.currentState!
                                    .validate() &&
                                controller.cityKey.currentState!.validate() &&
                                controller.countryKey.currentState!
                                    .validate() &&
                                controller.timezoneKey.currentState!
                                    .validate()) {
                              controller.updateUserDetails();
                              Get.back();
                            }
                          },
                          style: ElevatedButton.styleFrom(
                              primary: ThemeColor.primaryBlack,
                              textStyle: const TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold)),
                          child: const Text('Edit'),
                        ),
                      ]))));
    });
  }
}
