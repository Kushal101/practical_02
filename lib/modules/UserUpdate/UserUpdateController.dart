import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:practical_task_02/apis/Service.dart';
import 'package:practical_task_02/models/UserDetail.dart';

import '../userDetails/UserDetailController.dart';

class UserUpdateController extends GetxController {
  String userId = Get.arguments[0];
  AppService appService = AppService();
  Rx<TextEditingController> firstName = TextEditingController().obs;
  Rx<TextEditingController> lastName = TextEditingController().obs;
  Rx<TextEditingController> picture = TextEditingController().obs;
  Rx<TextEditingController> gender = TextEditingController().obs;
  Rx<TextEditingController> email = TextEditingController().obs;
  Rx<TextEditingController> dateOfBirth = TextEditingController().obs;
  Rx<TextEditingController> phone = TextEditingController().obs;
  Rx<TextEditingController> street = TextEditingController().obs;
  Rx<TextEditingController> city = TextEditingController().obs;
  Rx<TextEditingController> state = TextEditingController().obs;
  Rx<TextEditingController> country = TextEditingController().obs;
  Rx<TextEditingController> timezone = TextEditingController().obs;
  final firstNameKey = GlobalKey<FormState>();
  final lastNameKey = GlobalKey<FormState>();
  final pictureKey = GlobalKey<FormState>();
  final emailKey = GlobalKey<FormState>();
  final genderKey = GlobalKey<FormState>();
  final dateOfBirthKey = GlobalKey<FormState>();
  final phoneKey = GlobalKey<FormState>();
  final streetKey = GlobalKey<FormState>();
  final cityKey = GlobalKey<FormState>();
  final stateKey = GlobalKey<FormState>();
  final countryKey = GlobalKey<FormState>();
  final timezoneKey = GlobalKey<FormState>();
  bool isLoading = true;
  List<UserDetailModel> userDetailList = [];

  @override
  void onInit() {
    super.onInit();
    fetchUserDetails();
    Future.delayed(Duration(seconds: 1), () {
      firstName.value =
          TextEditingController(text: userDetailList[0].firstname.toString());

      lastName.value =
          TextEditingController(text: userDetailList[0].lastname.toString());
      dateOfBirth.value =
          TextEditingController(text: userDetailList[0].dateOfBirth.toString());
      picture.value =
          TextEditingController(text: userDetailList[0].picture.toString());
      email.value =
          TextEditingController(text: userDetailList[0].email.toString());
      gender.value =
          TextEditingController(text: userDetailList[0].gender.toString());
      phone.value =
          TextEditingController(text: userDetailList[0].phone.toString());
      street.value =
          TextEditingController(text: userDetailList[0].street.toString());
      city.value =
          TextEditingController(text: userDetailList[0].city.toString());
      state.value =
          TextEditingController(text: userDetailList[0].state.toString());
      country.value =
          TextEditingController(text: userDetailList[0].country.toString());
      timezone.value =
          TextEditingController(text: userDetailList[0].timeZone.toString());
    });
  }

  void fetchUserDetails() async {
    var response = await appService.getUserDetails(userId: userId);
    if (response != null) {
      userDetailList.add(UserDetailModel.fromMap(response));
      isLoading = false;
      update();
    }
  }

  void updateUserDetails() async {
    var response = await appService.updateUserDetails(
        userId: userId,
        firstName: firstName.value.text,
        lastName: lastName.value.text,
        picture: picture.value.text,
        email: email.value.text,
        phone: phone.value.text,
        gender: gender.value.text,
        street: street.value.text,
        DOB: dateOfBirth.value.text,
        city: city.value.text,
        country: country.value.text,
        timeZone: timezone.value.text,
        state: state.value.text);
    if (response != null) {
      //userDetailList.add(UserDetailModel.fromMap(response));
      UserDetailsController().onInit();
      isLoading = false;
      update();
    }
  }
}
