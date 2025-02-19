import 'package:playmaster_ui/dependency.dart';
import 'package:playmaster_ui/module/home/home.dart';

class FriendRequestScreen extends StatelessWidget {
  const FriendRequestScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBar(
        titleText: "Friend requests",
        isShowWallet: false,
        isAppLogo: false,
      ),
      body: const Center(
        child: AppText(text: "Friend request screen"),
      ),
    );
  }
}
