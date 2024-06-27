import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:sportifan_user/constants/colors_all.dart';
import 'package:sportifan_user/constants/routes.dart';
import 'package:sportifan_user/main.dart';
import 'package:sportifan_user/screens/homeview.dart';
import 'package:sportifan_user/widgets/custom_proceed_button.dart';
import 'package:sportifan_user/widgets/sidebar.dart';
import 'package:sportifan_user/widgets/team_logo.dart';
import 'package:sportifan_user/widgets/top_navigation_bar.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ConfirmBookingPage extends ConsumerWidget {
  ConfirmBookingPage({super.key});

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    TextEditingController controller = TextEditingController();
    return Container(
      color: const Color(0xFF238F20),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: const Color(0xFFFAFAFA),
          key: _scaffoldKey,
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(9.h),
            child: TopNavigationBar(
              controller: controller,
              onNotificationIconTapped: () {
                _scaffoldKey.currentState?.openDrawer();
              },
              onSearchChanged: (query) {},
            ),
          ),
          drawer: SideBar(
            notificationExists: true,
            onTapFunctions: {
              'Highlights': () {
                ref.read(counterProvider.notifier).update(2);
                navigatorKey.currentState?.pushReplacementNamed(homePageRoute);
              },
              'Stats': () {
                ref.read(counterProvider.notifier).update(3);
                navigatorKey.currentState?.pushReplacementNamed(homePageRoute);
              }
            },
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 2.h),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 2.h,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.navigate_before,
                        size: 3.h,
                        color: ColorsAll.greenCol,
                      ),
                    ),
                    SizedBox(
                      height: (20 / 8).h,
                    ),
                    Text(
                      'Confirm Booking',
                      style: TextStyle(
                        color: const Color(0xFF262626),
                        fontSize: 20.sp,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                        height: 0,
                      ),
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Laal Bagh Gully ',
                              style: TextStyle(
                                color: const Color(0xFF262626),
                                fontSize: 12.sp,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500,
                                height: 0,
                              ),
                            ),
                            SizedBox(
                              height: 1.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.location_on,
                                  size: 2.h,
                                  color: const Color.fromRGBO(115, 115, 115, 1),
                                ),
                                SizedBox(
                                  width: (8 / 3.6).w,
                                ),
                                Text(
                                  'Phool Bagan, Kankurgachi',
                                  style: TextStyle(
                                    color: const Color(0xFF727272),
                                    fontSize: 8.5.sp,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w400,
                                    height: 0,
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 1.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.calendar_month,
                                  size: 2.h,
                                  color: const Color.fromRGBO(115, 115, 115, 1),
                                ),
                                SizedBox(
                                  width: (8 / 3.6).w,
                                ),
                                Text(
                                  'Mon - 12 Feb',
                                  style: TextStyle(
                                    color: const Color(0xFF727272),
                                    fontSize: 8.5.sp,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w400,
                                    height: 0,
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 1.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.timer_outlined,
                                  size: 2.h,
                                  color: const Color.fromRGBO(115, 115, 115, 1),
                                ),
                                SizedBox(
                                  width: (8 / 3.6).w,
                                ),
                                Text(
                                  '8am- 9am',
                                  style: TextStyle(
                                    color: const Color(0xFF727272),
                                    fontSize: 8.5.sp,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w400,
                                    height: 0,
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              '₹ 250/hr',
                              style: TextStyle(
                                color: const Color(0xFF262626),
                                fontSize: 14.sp,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500,
                                height: 0,
                              ),
                            ),
                            SizedBox(
                              height: 0.25.h,
                            ),
                            Text(
                              'onwards',
                              style: TextStyle(
                                color: const Color(0xFF727272),
                                fontSize: 8.5.sp,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w400,
                                height: 0,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    Container(
                      width: 100.w - (32 / 3.6).w,
                      // height: 120,
                      decoration: BoxDecoration(
                        color: const Color(0xFFFDEDB3),
                        borderRadius: BorderRadius.all(Radius.circular(1.h)),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(2.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const TeamLogo(
                                    isActive: false, iconName: 'TeamIcon'),
                                SizedBox(
                                  height: 1.h,
                                ),
                                Text(
                                  'KKR',
                                  style: TextStyle(
                                    color: const Color(0xFF262626),
                                    fontSize: 14.sp,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w600,
                                    height: 0,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                DottedLine(
                                  direction: Axis.vertical,
                                  lineLength: 3.h,
                                  lineThickness: (1 / 3.6).w,
                                  dashLength: 0.25.h,
                                  dashColor:
                                      const Color.fromRGBO(251, 196, 1, 1),
                                  dashRadius: 0.0,
                                  dashGapLength: 0.25.h,
                                  dashGapColor: Colors.transparent,
                                  dashGapRadius: 0.0,
                                ),
                                Text(
                                  'VS',
                                  style: TextStyle(
                                    color: const Color(0x19262626),
                                    fontSize: 32.sp,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w700,
                                    height: 0,
                                  ),
                                ),
                                DottedLine(
                                  direction: Axis.vertical,
                                  lineLength: 3.h,
                                  lineThickness: (1 / 3.6).w,
                                  dashLength: 0.25.h,
                                  dashColor:
                                      const Color.fromRGBO(251, 196, 1, 1),
                                  dashRadius: 0.0,
                                  dashGapLength: 0.25.h,
                                  dashGapColor: Colors.transparent,
                                  dashGapRadius: 0.0,
                                ),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const TeamLogo(
                                    isActive: false, iconName: 'TeamIcon2'),
                                SizedBox(
                                  height: 1.h,
                                ),
                                Text(
                                  'CSK',
                                  style: TextStyle(
                                    color: const Color(0xFF262626),
                                    fontSize: 14.sp,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w600,
                                    height: 0,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Price Breakdown',
                          style: TextStyle(
                            color: const Color(0xFF262626),
                            fontSize: 12.sp,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                            height: 0,
                          ),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Venue Price (1 hour)',
                              style: TextStyle(
                                color: const Color(0xFF727272),
                                fontSize: 10.sp,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500,
                                height: 0,
                              ),
                            ),
                            Text(
                              '₹ 250',
                              style: TextStyle(
                                color: const Color(0xFF262626),
                                fontSize: 10.sp,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500,
                                height: 0,
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Convenience Fee',
                              style: TextStyle(
                                color: const Color(0xFF727272),
                                fontSize: 10.sp,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500,
                                height: 0,
                              ),
                            ),
                            Text(
                              '₹ 25',
                              style: TextStyle(
                                color: const Color(0xFF262626),
                                fontSize: 10.sp,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500,
                                height: 0,
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Divider(
                          color: const Color.fromRGBO(189, 222, 189, 1),
                          thickness: (1 / 3.6).w,
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Total',
                              style: TextStyle(
                                color: const Color(0xFF262626),
                                fontSize: 12.sp,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500,
                                height: 0,
                              ),
                            ),
                            Text(
                              '₹ 275',
                              style: TextStyle(
                                color: const Color(0xFF262626),
                                fontSize: 12.sp,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w600,
                                height: 0,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Booking Policies',
                          style: TextStyle(
                            color: const Color(0xFF727272),
                            fontSize: 12.sp,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                            height: 0,
                          ),
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        Text(
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et olore magna aliqua. orem ipsum dolor sit amet,             ',
                          style: TextStyle(
                            color: const Color(0xFF727272),
                            fontSize: 10.sp,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                            height: 0,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          bottomNavigationBar: Container(
            height: 10.h,
            padding: EdgeInsets.all(2.h),
            decoration: const BoxDecoration(
              color: Colors.white,
              border: Border(
                left: BorderSide(color: Color(0xFFD9D9D9)),
                top: BorderSide(color: Color(0xFFD9D9D9)),
                right: BorderSide(color: Color(0xFFD9D9D9)),
                bottom: BorderSide(width: 1, color: Color(0xFFD9D9D9)),
              ),
              boxShadow: [
                BoxShadow(
                  color: Color(0x14000000),
                  blurRadius: 16,
                  offset: Offset(0, -8),
                  spreadRadius: 0,
                )
              ],
            ),
            child: CustomButton(
              text: 'Proceed To Pay ₹ 275',
              callback: () {},
              height: 6.h,
              width: 100.w - (32 / 3.6).w,
              color: const Color(0xFF238F20),
            ),
          ),
        ),
      ),
    );
  }
}
