import 'package:xpressfly_app/dependency.dart';
import 'package:xpressfly_app/module/auth/auth.dart';

class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppAssets.getStartedBgImg),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          AppButton(
            onTap: () {
              Navigation.push(LoginWithNumberScreen());
            },
            text: AppString.getStarted,
            buttonMargin: EdgeInsets.all(36.h),
          )
        ],
      ),
    );
  }
}
