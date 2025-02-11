import 'package:playmaster_ui/dependency.dart';

class AuthTextFieldWithLabel extends StatelessWidget {
  const AuthTextFieldWithLabel({
    Key? key,
    required this.labelName,
    required this.hintText,
    required this.textFieldController,
    this.isPasswordField = false,
    this.isEmailField = false,
    this.isUsername = false,
  }) : super(key: key);

  final String labelName;
  final String hintText;
  final bool isPasswordField;
  final bool isEmailField;
  final bool isUsername;
  final TextEditingController textFieldController;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText(
          text: labelName ?? "",
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
        ),
        8.h.verticalSpace,
        AppTextField(
          height: 64.h,
          hintText: hintText,
          obscureText: isPasswordField,
          controller: textFieldController,
          keyboardType: isEmailField ? TextInputType.emailAddress : TextInputType.text,
          textInputAction: (isEmailField || isUsername) ? TextInputAction.next : TextInputAction.done,
        )
      ],
    );
  }
}
