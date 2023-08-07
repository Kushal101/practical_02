import 'package:get/get.dart';
import 'package:practical_task_02/apis/Service.dart';
import 'package:practical_task_02/models/UserDetail.dart';

class UserDetailsController extends GetxController {
  String userId = Get.arguments[0];
  AppService appService = AppService();

  bool isLoading = true;
  List<UserDetailModel> userDetailList = [];

  @override
  void onInit() {
    super.onInit();
    fetchUserDetails();
  }

  void fetchUserDetails() async {
    var response = await appService.getUserDetails(userId: userId);
    if (response != null) {
      userDetailList.add(UserDetailModel.fromMap(response));
      print(userDetailList);
      isLoading = false;
      update();
    }
  }
}
