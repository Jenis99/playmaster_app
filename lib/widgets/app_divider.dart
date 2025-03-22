import 'package:xpressfly_app/dependency.dart';

class AppDivider extends StatelessWidget {
  final double? height;
  final double? thickness;

  const AppDivider({this.height, this.thickness, super.key});

  @override
  Widget build(BuildContext context) {
    return Divider(color: AppColors.grey400Color, height: height, thickness: thickness);
  }
}
