import 'package:flutter/material.dart';
import 'package:sportifan_user/constants/colors_all.dart';
import 'package:sportifan_user/constants/routes.dart';
import 'package:sportifan_user/main.dart';

import 'package:sportifan_user/screens/homeview.dart';
import 'package:sportifan_user/widgets/sidebar.dart';
import 'package:sportifan_user/widgets/top_navigation_bar.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class KeyMoment extends ConsumerStatefulWidget {
  const KeyMoment({super.key});

  @override
  ConsumerState<KeyMoment> createState() => _KeyMomentState();
}

class _KeyMomentState extends ConsumerState<KeyMoment> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
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
                      height: 2.h,
                    ),
                    Text(
                      'Key Moment ',
                      style: TextStyle(
                        color: const Color(0xFF262626),
                        fontSize: 20.sp,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                        height: 0,
                      ),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: (20 / 8).h,
                          height: (20 / 8).h,
                          decoration: ShapeDecoration(
                            color: const Color.fromRGBO(251, 196, 1, 1),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(2.h),
                            ),
                          ),
                          child: Icon(
                            Icons.star,
                            size: 2.h,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          width: (8 / 3.6).w,
                        ),
                        Text(
                          '1st Boundary ',
                          style: TextStyle(
                            color: const Color(0xFF262626),
                            fontSize: 13.sp,
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
                    Stack(
                      alignment:
                          Alignment.center, // This will center the second image
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: 100.w - (32 / 3.6).w,
                              // height: 96,
                              decoration: ShapeDecoration(
                                color: const Color(0xFFD9D9D9),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(1.h),
                                ),
                              ),
                              child: Image.asset(
                                'assets/images/VenueImage_dark.png',
                                fit: BoxFit.fill,
                              ),
                            ),
                          ],
                        ),
                        Image.asset(
                            'assets/images/play_circle_outline.png'), // Replace with your second image
                      ],
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    SizedBox(
                      width: 100.w - (32 / 3.6).w,
                      child: Text(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et olore magna aliqua. orem ipsum dolor sit amet,             ',
                        style: TextStyle(
                          color: const Color(0xFF727272),
                          fontSize: 10.sp,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                          height: 0,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
