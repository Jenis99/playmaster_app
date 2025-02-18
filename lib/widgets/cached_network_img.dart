import 'package:cached_network_image/cached_network_image.dart';
import 'package:playmaster_ui/dependency.dart';

class CachedNetworkImg extends StatelessWidget {
  const CachedNetworkImg({
    super.key,
    this.fit,
    this.imgSize,
    this.imgWidth,
    this.imgHeight,
    this.imgColor,
    this.borderRadius,
    this.isAssetImg = false,
    required this.imgPath,
  });

  final BoxFit? fit;
  final String imgPath;
  final double? imgSize;
  final double? imgHeight;
  final double? imgWidth;
  final bool isAssetImg;
  final Color? imgColor;
  final double? borderRadius;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius ?? 0),
      child: !isAssetImg
          ? CachedNetworkImage(
              color: imgColor,
              // imageUrl: "https://www.exhibit.tech/wp-content/uploads/2023/05/desktop-wallpaper-100-best-bgmi-names-for-new-version-of-pubg-bgmi-pubg.jpg",
              imageUrl: imgPath,
              height: imgSize ?? imgHeight,
              width: imgSize ?? imgWidth,
              fit: fit ?? BoxFit.cover,
              progressIndicatorBuilder: (context, url, downloadProgress) => Center(
                child: CircularProgressIndicator(
                  value: downloadProgress.progress,
                  color: AppColors.primaryColor,
                ),
              ),
              errorWidget: (context, url, error) => Center(child: const Icon(Icons.error)),
            )
          : Image.asset(
              imgPath,
              color: imgColor,
              fit: fit ?? BoxFit.cover,
              height: imgSize ?? imgHeight,
              width: imgSize ?? imgWidth,
            ),
    );
  }
}
