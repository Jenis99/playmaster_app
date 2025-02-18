import 'package:playmaster_ui/dependency.dart';

class CommonTabBarElement extends StatelessWidget {
  const CommonTabBarElement({Key? key, required this.title, required this.onTap, required this.index, required this.selectedIndex, this.titleSize})
      : super(key: key);

  final String title;
  final Function(int) onTap;
  final int index;
  final int selectedIndex;
  final int? titleSize;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap.call(index);
      },
      child: Container(
        color: AppColors.transparentClr,
        child: AppText(
          text: title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          fontSize: 12.sp,
          fontWeight: selectedIndex == index ? FontWeight.w700 : FontWeight.w400,
          color: selectedIndex == index ? AppColors.whiteColor : AppColors.grey400Color,
        ),
      ),
    );
  }
}
