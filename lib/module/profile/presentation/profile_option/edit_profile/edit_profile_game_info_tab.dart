import 'package:playmaster_ui/dependency.dart';
import 'package:playmaster_ui/module/auth/auth.dart';
import 'package:playmaster_ui/module/profile/profile.dart';

class EditProfileGameInfoTab extends StatelessWidget {
  EditProfileGameInfoTab({Key? key}) : super(key: key);

  final EditProfileController editProfileController = Get.put(EditProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      // floatingActionButton: ,
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
              itemBuilder: (context, index) {
                final data = editProfileController.gameInfoList[index];
                return AuthTextFieldWithLabel(
                  textFieldController: data.textEditingController,
                  hintText: AppString.enterPlayerID,
                  labelName: data.title,
                  textFieldClr: AppColors.grey900Color2,
                  isDoneField: (index + 1) <= editProfileController.gameInfoList.length ? true : false,
                );
              },
              itemCount: editProfileController.gameInfoList.length,
            ),
          ),
          Container(
            color: AppColors.grey900Color2,
            child: AppButton(
              text: AppString.saveTag,
              buttonMarginPadding: EdgeInsets.all(AppConstants.appHorizontalPadding),
            ),
          )
        ],
      ),
    );
  }
}
