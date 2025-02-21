import 'package:playmaster_ui/dependency.dart';

class ProfileController extends GetxController {
  TextEditingController currentPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  static ProfileController get find => Get.isRegistered<ProfileController>() ? Get.find() : Get.put(ProfileController());
}
