import 'package:playmaster_ui/dependency.dart';

class AuthTextFieldWithLabel extends StatelessWidget {
  const AuthTextFieldWithLabel({
    Key? key,
    required this.labelName,
    required this.hintText,
    required this.textFieldController,
    this.isPasswordField = false,
    this.isEmailField = false,
    this.isTapOutsideEnable = false,
    this.isUsername = false,
    this.isDoneField = false,
    this.textFieldClr,
    this.onChanged,
    this.isBottomPaddingApply,
  }) : super(key: key);

  final String labelName;
  final String hintText;
  final bool isPasswordField;
  final bool isEmailField;
  final bool isUsername;
  final bool isTapOutsideEnable;
  final bool? isBottomPaddingApply;
  final bool isDoneField;
  final Color? textFieldClr;
  final Function(String)? onChanged;
  final TextEditingController textFieldController;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText(
          text: labelName,
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
        ),
        8.h.verticalSpace,
        AppTextField(
          height: 64.h,
          color: textFieldClr,
          isBottomPaddingApply: isBottomPaddingApply ?? true,
          hintText: hintText,
          fontSize: 14.sp,
          contentPadding: EdgeInsets.all(12.h),
          obscureText: isPasswordField,
          isTapOutsideEnable: isTapOutsideEnable,
          controller: textFieldController,
          onChanged: onChanged,
          keyboardType: isEmailField ? TextInputType.emailAddress : TextInputType.text,
          textInputAction: (isEmailField || isUsername || isDoneField) ? TextInputAction.next : TextInputAction.done,
        ),

        /// Favourite game
      ],
    );
  }
}
