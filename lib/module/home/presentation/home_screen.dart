import 'package:xpressfly_app/dependency.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1C1C1C),
      endDrawer: Center(
        child: AppText(text: "Work in progress"),
      ),
      appBar: AppBar(
        backgroundColor: Color(0xff1C1C1C),
        automaticallyImplyLeading: false,
        title: AppRichText(
          firstTitle: "Hi, ",
          secondTitle: "Dhanush",
          firstTitleColor: AppColors.whiteColor,
          secondTitleColor: AppColors.primaryColor,
          fontSize: 30.sp,
        ).paddingOnly(left: 18.w),
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(topRight: Radius.circular(20.r), topLeft: Radius.circular(20.r)),
        child: Image.asset(AppAssets.bottomBar),
      ),
      body: Column(
        children: [
          /// 10 lacs+ customers
          10.h.verticalSpace,
          verifiedCustomerView(),
          10.h.verticalSpace,
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              spacing: 5.w,
              children: [
                buildContainer(title: AppString.findLoads, imgPath: AppAssets.findLoadIcon).paddingOnly(left: 26.w),
                buildContainer(title: AppString.buyInsurance, imgPath: AppAssets.buyInsuranceIcon),
                buildContainer(title: AppString.findMechanic, imgPath: AppAssets.findMechanicIcon).paddingOnly(right: 26.w),
              ],
            ),
          ),
          addTruckView(),
          20.h.verticalSpace,

          /// Top load tile
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppText(
                text: AppString.topLoads,
                color: AppColors.whiteColor,
                fontWeight: FontWeight.w500,
                fontSize: 14.sp,
              ),
              AppText(
                text: AppString.viewAll,
                color: AppColors.hintTextColor,
                fontWeight: FontWeight.w500,
                fontSize: 12.sp,
              ),
            ],
          ).paddingSymmetric(horizontal: 26.w),
          20.h.verticalSpace,

          /// Top loads view
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(children: List.generate(5, (index) => commonTopLoadsCard(index))),
          )
        ],
      ),
    );
  }

  GestureDetector commonTopLoadsCard(int index) {
    return GestureDetector(
      onTap: () {},
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            margin: EdgeInsets.all(15.h),
            padding: EdgeInsets.all(15.h),
            decoration: BoxDecoration(
              color: AppColors.lightGreyColor,
              borderRadius: BorderRadius.circular(AppConstants.commonRadius),
            ),
            child: Column(
              // mainAxisSize: MainAxisSize.min,
              children: [
                30.h.verticalSpace,
                AppText(
                  text: "Ramkamal Enterprises",
                  fontWeight: FontWeight.w500,
                  color: AppColors.whiteColor,
                  fontSize: 14.sp,
                ),
                10.h.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Column(
                          children: [
                            Container(
                              height: 7.h,
                              width: 7.h,
                              decoration: BoxDecoration(
                                color: AppColors.whiteColor,
                                shape: BoxShape.circle,
                              ),
                            ),
                            Container(
                              color: AppColors.whiteColor,
                              height: 150.h,
                              width: 2,
                            ),
                            Container(
                              height: 7.h,
                              width: 7.h,
                              decoration: BoxDecoration(
                                color: AppColors.whiteColor,
                                shape: BoxShape.circle,
                              ),
                            ),
                          ],
                        ),
                        5.w.horizontalSpace,
                        SizedBox(
                          height: 175.h,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Row(children: [
                                Container(
                                  height: 7.h,
                                  width: 7.h,
                                  decoration: BoxDecoration(
                                    color: AppColors.primaryColor,
                                    shape: BoxShape.circle,
                                  ),
                                ),
                                AppText(text: "Surat"),
                              ]),
                              Row(children: [
                                Container(
                                  height: 7.h,
                                  width: 7.h,
                                  decoration: BoxDecoration(
                                    color: AppColors.primaryColor,
                                    shape: BoxShape.circle,
                                  ),
                                ),
                                AppText(text: "Surat"),
                              ]),
                            ],
                          ),
                        )
                      ],
                    ),
                    20.w.horizontalSpace,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        AppText(text: "2.00 Tonne(s)", fontSize: 12.sp, fontWeight: FontWeight.w400, color: AppColors.hintTextColor),
                        AppText(text: "LCV", fontSize: 12.sp, fontWeight: FontWeight.w400, color: AppColors.hintTextColor),
                        20.h.verticalSpace,
                        AppText(text: "5000", fontSize: 16.sp, fontWeight: FontWeight.w400, color: AppColors.primaryColor),
                        AppText(text: "2500/Tonne (ask price)", fontSize: 12.sp, fontWeight: FontWeight.w400, color: AppColors.whiteColor),
                        20.h.verticalSpace,
                        AppButton(
                          text: "Bid Now",
                          width: 109.w,
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
          Image.asset(
            AppAssets.companyLogo,
            height: 55.h,
          )
        ],
      ).paddingOnly(left: index == 0 ? 26.w : 0, right: index == 4 ? 26.w : 0),
    );
  }

  Widget addTruckView() {
    return Container(
      height: 150.h,
      margin: EdgeInsets.symmetric(horizontal: 26.w),
      decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(AppAssets.joinUsBanner), fit: BoxFit.fill),
          borderRadius: BorderRadius.circular(20.r),
          color: AppColors.whiteColor),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 18.w, vertical: 10.h),
                padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 10.h),
                decoration: BoxDecoration(color: AppColors.whiteColor, borderRadius: BorderRadius.circular(50.r)),
                child: AppText(
                  text: AppString.joinUsTag,
                  color: AppColors.lightGreyColor,
                ),
              ),
            ],
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              margin: EdgeInsets.all(15.h),
              padding: EdgeInsets.all(15.h),
              decoration: BoxDecoration(
                color: AppColors.lightGreyColor,
                borderRadius: BorderRadius.circular(AppConstants.commonRadius),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(AppAssets.addTruckIcon, height: 42.h, width: 42.h),
                  AppText(
                    text: AppString.addTruck,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget buildContainer({required String title, required String imgPath}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 10.h),
      decoration: BoxDecoration(color: AppColors.lightGreyColor, borderRadius: BorderRadius.circular(50.r)),
      child: Row(
        spacing: 10.w,
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            AppAssets.findLoadIcon,
            height: 14.h,
            width: 14.h,
          ),
          AppText(text: AppString.findLoads)
        ],
      ),
    );
  }

  Container verifiedCustomerView() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 26.w),
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      decoration: BoxDecoration(
        color: AppColors.lightGreyColor,
        borderRadius: BorderRadius.circular(AppConstants.commonRadius),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              AppRichText(
                fontSize: 30.sp,
                secondTitle: " Lakhs",
                firstFontWeight: FontWeight.w600,
                firstTitle: "10+",
                firstTitleColor: AppColors.whiteColor,
                secondTitleColor: AppColors.primaryColor,
              ),
              AppText(
                text: AppString.verifiedCustomer,
                fontSize: 16.sp,
                color: AppColors.lightTextClr,
                fontWeight: FontWeight.w400,
              ),
            ],
          ),
          Image.asset(
            AppAssets.verifyCustomer,
            width: 107.w,
            height: 90.h,
          )
        ],
      ),
    );
  }
}
