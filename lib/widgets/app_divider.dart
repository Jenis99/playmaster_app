import 'package:playmaster_ui/dependency.dart';

class AppDivider extends StatelessWidget {
  final double? height;
  final double? thickness;
  final Color? color;

  const AppDivider({this.height, this.thickness, super.key, this.color});

  @override
  Widget build(BuildContext context) {
    return Divider(color: color ?? AppColors.grey400Color, height: height, thickness: thickness);
  }
}
