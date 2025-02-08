import 'package:playmaster_ui/dependency.dart';

class LastMinuteGameCard extends StatelessWidget {
  const LastMinuteGameCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: 293.h,
      margin: EdgeInsets.symmetric(horizontal: 5.w),
      decoration: BoxDecoration(color: AppColors.grey900Color2, borderRadius: BorderRadius.circular(4.r)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Game image
          CachedNetworkImg(
            imgPath:
                "https://s3-alpha-sig.figma.com/img/a99b/95b8/30274f57e0e2e22fdbc6edcf3763013d?Expires=1739750400&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=Yz6MaYluspyJ83wBKR2WNCXZsVufyXFz1Rb~XWKpEdoFSjHiGT4H1fZGYKOO0zPby9mvQApBD2uWs4J-R2cZxsz2RHeK5e8UoyNs8n-o0ymvEMofODQMuZn5D8LmS8-WMTivOzCEmdSMEjS~UquMe-oSfjdPpM8ewuB1pol23n0BEtNTTzAaD2~rJSRFzBN4tNHL3YQlaDK-P8j~SHedG7KheOIZGrbzRUXoI6EyYE5lBwvW8~zWcnC5Ks~8extPmUD~B6MV8deQQQUsFVZS36eHkL5Ij8mjtgbKD5-of7~kzm3g-Df-iPwRjy~AQdmFPiA81tkxVhb2R6Hg8yRW7A__",
            imgWidth: 140.w,
            imgHeight: 140.h,
            borderRadius: 4.r,
          ),

          16.h.verticalSpace,

          /// Game title
          AppText(
            text: "Valorant - Unrank Medium Pool",
            maxLines: 2,
            fontWeight: FontWeight.w500,
            color: AppColors.whiteColor,
            fontSize: 16.sp,
          ).paddingSymmetric(horizontal: 12.w),

          /// Price pool
          AppText(
            text: "₹600/team",
            fontWeight: FontWeight.w500,
            color: AppColors.grey400Color,
            fontSize: 14.sp,
          ).paddingSymmetric(horizontal: 12.w, vertical: 10.h),

          /// Entry fee
          FittedBox(
            child: AppText(
              text: "1000 Prize pool",
              fontWeight: FontWeight.w500,
              color: AppColors.greenClr,
              fontSize: 12.sp,
            ).paddingOnly(right: 10.h),
          ),
          AppText(
            fontSize: 12.sp,
            maxLines: 1,
            fontWeight: FontWeight.w500,
            color: AppColors.grey500Color,
            text: "Start at 12 Jun, 10:00pm",
          ),
        ],
      ),
    );
  }
}
