import 'package:playmaster_ui/dependency.dart';

class PastGameTab extends StatelessWidget {
  const PastGameTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.lock,
          size: 40.sp,
          color: AppColors.grey500Color,
        ),
        13.h.verticalSpace,
        AppText(
          text: """Follow account to \n view player’s details""",
          textAlign: TextAlign.center,
        )
      ],
    );
  }
}
