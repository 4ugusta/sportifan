import 'package:dotted_border/dotted_border.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:sportifan_user/constants/colors_all.dart';
import 'package:sportifan_user/constants/routes.dart';
import 'package:sportifan_user/main.dart';
import 'package:sportifan_user/models/venue.dart';

import 'package:sportifan_user/screens/homeview.dart';
import 'package:sportifan_user/screens/main/booking/confirm_booking.dart';
import 'package:sportifan_user/widgets/custom_proceed_button.dart';
import 'package:sportifan_user/widgets/player_name_and_icon.dart';
import 'package:sportifan_user/widgets/sidebar.dart';
import 'package:sportifan_user/widgets/team_logo.dart';
import 'package:sportifan_user/widgets/text_tile.dart';
import 'package:sportifan_user/widgets/top_navigation_bar.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class VenueScreen extends ConsumerStatefulWidget {
  final Venue venue;
  const VenueScreen(this.venue, {super.key});

  @override
  ConsumerState<VenueScreen> createState() => _VenueScreenState();
}

class _VenueScreenState extends ConsumerState<VenueScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  String selectedDate = 'Mon - 12 Feb';
  String selectedTime = '6am - 7am';
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
            preferredSize: Size.fromHeight(9.h), // Set the height here
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.all(2.h),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
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
                          height: 3.h,
                        ),
                        Text(
                          widget.venue.venueName ?? "",
                          style: TextStyle(
                            color: const Color(0xFF262626),
                            fontSize: 20.sp,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                            height: 0,
                          ),
                        ),
                        SizedBox(
                          height: 0.5.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              widget.venue.venueLocation ?? "",
                              style: TextStyle(
                                color: const Color(0xFF727272),
                                fontSize: 10.sp,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w400,
                                height: 0,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: (12 / 8).h, vertical: 0.5.h),
                              child: Text(
                                'View Maps',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: const Color(0xFF238F20),
                                  fontSize: 8.5.sp,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w500,
                                  height: 0,
                                ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: 2.h,
                              height: 2.h,
                              decoration: const ShapeDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment(0.00, -1.00),
                                  end: Alignment(0, 1),
                                  colors: [
                                    Color(0xFFFBC401),
                                    Color(0xFFFB9701)
                                  ],
                                ),
                                shape: StarBorder(
                                  points: 5,
                                  innerRadiusRatio: 0.38,
                                  pointRounding: 0,
                                  valleyRounding: 0,
                                  rotation: 0,
                                  squash: 0,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: (4 / 3.6).w,
                            ),
                            Text(
                              '${widget.venue.venueRating?.toString() ?? ""} Star ',
                              style: TextStyle(
                                color: const Color(0xFF262626),
                                fontSize: 8.5.sp,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500,
                                height: 0,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: (18 / 8).h,
                        ),
                        SizedBox(
                          width: 100.w - (32 / 3.6).w,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(1.h),
                            child: Image(
                              image: const AssetImage(
                                  "assets/images/VenueImage2.png"),
                              fit: BoxFit.cover,
                              height: (138 / 8).h,
                              filterQuality: FilterQuality.high,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Text(
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et olore magna aliqua. orem ipsum dolor sit amet,",
                          style: TextStyle(
                              fontSize: 11.sp,
                              fontWeight: FontWeight.w400,
                              color: Colors.black54),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        DottedBorder(
                          borderType: BorderType.RRect,
                          color: const Color(0xFFFBC400),
                          strokeWidth: 3,
                          radius: Radius.circular(1.h),
                          padding: EdgeInsets.zero,
                          child: IntrinsicHeight(
                            child: Container(
                              width: 100.w - (32 / 3.6).w,
                              height: 6.h,
                              decoration: BoxDecoration(
                                color: const Color(0xFFFDEDB3),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(1.h)),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(1.h),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Venue Amenities',
                                      style: TextStyle(
                                        color: const Color(0xFF727272),
                                        fontSize: 8.5.sp,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w300,
                                        height: 0,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 0.75.h,
                                    ),
                                    Text(
                                      'Parking space, Food, RO Water , UPI Accepted',
                                      style: TextStyle(
                                        color: const Color(0xFF262626),
                                        fontSize: 8.5.sp,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w500,
                                        height: 0,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      padding: EdgeInsets.only(top: 0.5.h),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 2.h),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    'Select Date',
                                    style: TextStyle(
                                      color: const Color(0xFF262626),
                                      fontSize: 13.sp,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w500,
                                      height: 0,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 2.h,
                              ),
                              SizedBox(
                                height: (27 / 8).h,
                                child: ListView(
                                  scrollDirection: Axis.horizontal,
                                  children: [
                                    SizedBox(
                                      width: (16 / 3.6).w,
                                    ),
                                    TextTile(
                                      tilename: 'Mon - 12 Feb',
                                      isSelected:
                                          selectedDate == 'Mon - 12 Feb',
                                      onTap: () {
                                        setState(() {
                                          selectedDate = 'Mon - 12 Feb';
                                        });
                                      },
                                    ),
                                    TextTile(
                                      tilename: 'Tue - 13 Feb',
                                      isSelected:
                                          selectedDate == 'Tue - 13 Feb',
                                      onTap: () {
                                        setState(() {
                                          selectedDate = 'Tue - 13 Feb';
                                        });
                                      },
                                    ),
                                    TextTile(
                                      tilename: 'Wed - 14 Feb',
                                      isSelected:
                                          selectedDate == 'Wed - 14 Feb',
                                      onTap: () {
                                        setState(() {
                                          selectedDate = 'Wed - 14 Feb';
                                        });
                                      },
                                    ),
                                    TextTile(
                                      tilename: 'Thu - 15 Feb',
                                      isSelected:
                                          selectedDate == 'Thu - 15 Feb',
                                      onTap: () {
                                        setState(() {
                                          selectedDate = 'Thu - 15 Feb';
                                        });
                                      },
                                    ),
                                    TextTile(
                                      tilename: 'Fri - 15 Feb',
                                      isSelected:
                                          selectedDate == 'Fri - 15 Feb',
                                      onTap: () {
                                        setState(() {
                                          selectedDate = 'Fri - 15 Feb';
                                        });
                                      },
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 2.h),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    'Select Time',
                                    style: TextStyle(
                                      color: const Color(0xFF262626),
                                      fontSize: 13.sp,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w500,
                                      height: 0,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 2.h,
                              ),
                              SizedBox(
                                height: (27 / 8).h,
                                child: ListView(
                                  scrollDirection: Axis.horizontal,
                                  children: [
                                    SizedBox(
                                      width: (16 / 3.6).w,
                                    ),
                                    TextTile(
                                      tilename: '6am - 7am',
                                      isSelected: selectedTime == '6am - 7am',
                                      onTap: () {
                                        setState(() {
                                          selectedTime = '6am - 7am';
                                        });
                                      },
                                    ),
                                    TextTile(
                                      tilename: '7am - 8am',
                                      isSelected: selectedTime == '7am - 8am',
                                      onTap: () {
                                        setState(() {
                                          selectedTime = '7am - 8am';
                                        });
                                      },
                                    ),
                                    TextTile(
                                      tilename: '8am - 9am',
                                      isSelected: selectedTime == '8am - 9am',
                                      onTap: () {
                                        setState(() {
                                          selectedTime = '8am - 9am';
                                        });
                                      },
                                    ),
                                    TextTile(
                                      tilename: '9am - 10am',
                                      isSelected: selectedTime == '9am - 10am',
                                      onTap: () {
                                        setState(() {
                                          selectedTime = '9am - 10am';
                                        });
                                      },
                                    ),
                                    TextTile(
                                      tilename: '10am - 11am',
                                      isSelected: selectedTime == '10am - 11am',
                                      onTap: () {
                                        setState(() {
                                          selectedTime = '10am - 11am';
                                        });
                                      },
                                    ),
                                  ],
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 2.h),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Your Teams',
                          style: TextStyle(
                            color: const Color(0xFF262626),
                            fontSize: 13.sp,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                            height: 0,
                          ),
                        ),
                        SizedBox(
                          height: 0.5.h,
                        ),
                        Text(
                          'Select Team 1 and Team 2',
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
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  SizedBox(
                    height: 13.h,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        SizedBox(
                          width: (16 / 3.6).w,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const TeamLogo(
                              isActive: true,
                              iconName: 'TeamIcon',
                              teamNumber: '1',
                            ),
                            SizedBox(
                              height: 1.h,
                            ),
                            Text(
                              'KKR',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: const Color(0xFF262626),
                                fontSize: 10.sp,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500,
                                height: 0,
                              ),
                            ),
                            SizedBox(
                              height: 0.5.h,
                            ),
                            Text(
                              '12 players',
                              style: TextStyle(
                                color: const Color(0xFF727272),
                                fontSize: 8.5.sp,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w400,
                                height: 0,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 2.h,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const TeamLogo(
                              isActive: true,
                              iconName: 'TeamIcon2',
                              teamNumber: '2',
                            ),
                            SizedBox(
                              height: 1.h,
                            ),
                            Text(
                              'CSK',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: const Color(0xFF262626),
                                fontSize: 10.sp,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500,
                                height: 0,
                              ),
                            ),
                            SizedBox(
                              height: 0.5.h,
                            ),
                            Text(
                              '12 players',
                              style: TextStyle(
                                color: const Color(0xFF727272),
                                fontSize: 8.5.sp,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w400,
                                height: 0,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 2.h,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const TeamLogo(
                                isActive: false, iconName: 'TeamIcon5'),
                            SizedBox(
                              height: 1.h,
                            ),
                            Text(
                              'SRH',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: const Color(0xFF262626),
                                fontSize: 10.sp,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500,
                                height: 0,
                              ),
                            ),
                            SizedBox(
                              height: 0.5.h,
                            ),
                            Text(
                              '12 players',
                              style: TextStyle(
                                color: const Color(0xFF727272),
                                fontSize: 8.5.sp,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w400,
                                height: 0,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 2.h,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const TeamLogo(
                                isActive: false, iconName: 'AddIcon'),
                            SizedBox(
                              height: 1.h,
                            ),
                            Text(
                              'New Team',
                              style: TextStyle(
                                color: const Color(0xFF238F20),
                                fontSize: 8.5.sp,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500,
                                height: 0,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 2.h),
                    child: DottedBorder(
                      borderType: BorderType.RRect,
                      color: const Color(0xFFFBC400),
                      strokeWidth: (3 / 3.6).w,
                      radius: Radius.circular(1.h),
                      padding: EdgeInsets.zero,
                      child: IntrinsicHeight(
                        child: Container(
                          width: 100.w - (32 / 3.6).w,
                          // height: 120,
                          decoration: BoxDecoration(
                            color: const Color(0xFFFDEDB3),
                            borderRadius:
                                BorderRadius.all(Radius.circular(1.h)),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(2.h),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const TeamLogo(
                                            isActive: false,
                                            iconName: 'TeamIcon'),
                                        SizedBox(
                                          height: 1.h,
                                        ),
                                        Row(
                                          children: [
                                            SizedBox(
                                              width: (12 / 3.6).w,
                                            ),
                                            Text(
                                              'KKR',
                                              style: TextStyle(
                                                color: const Color(0xFF262626),
                                                fontSize: 16.sp,
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.w600,
                                                height: 0,
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: (14 / 8).h,
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        const PlayerNameAndIcon(
                                            playerName: 'Praty Monster'),
                                        const PlayerNameAndIcon(
                                          playerName: 'Gannu Bhai',
                                        ),
                                        const PlayerNameAndIcon(
                                            playerName: 'Salvatore'),
                                        const PlayerNameAndIcon(
                                          playerName: 'Aussie Dorm',
                                        ),
                                        Text(
                                          '+6 others',
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
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    DottedLine(
                                      direction: Axis.vertical,
                                      lineLength: 3.h,
                                      lineThickness: (1 / 3.6).w,
                                      dashLength: 0.5.h,
                                      dashColor:
                                          const Color.fromRGBO(251, 196, 1, 1),
                                      dashRadius: 0.0,
                                      dashGapLength: 0.5.h,
                                      dashGapColor: Colors.transparent,
                                      dashGapRadius: 0.0,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          vertical: (10 / 8).h),
                                      child: Text(
                                        'VS',
                                        style: TextStyle(
                                          color: const Color(0x19262626),
                                          fontSize: 32.sp,
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w700,
                                          height: 0,
                                        ),
                                      ),
                                    ),
                                    DottedLine(
                                      direction: Axis.vertical,
                                      lineLength: (132 / 8).h,
                                      lineThickness: (1 / 3.6).w,
                                      dashLength: 0.5.h,
                                      dashColor:
                                          const Color.fromRGBO(251, 196, 1, 1),
                                      dashRadius: 0.0,
                                      dashGapLength: 0.5.h,
                                      dashGapColor: Colors.transparent,
                                      dashGapRadius: 0.0,
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const TeamLogo(
                                            isActive: false,
                                            iconName: 'TeamIcon2'),
                                        SizedBox(
                                          height: 1.h,
                                        ),
                                        Row(
                                          children: [
                                            SizedBox(
                                              width: (12 / 3.6).w,
                                            ),
                                            Text(
                                              'CSK',
                                              style: TextStyle(
                                                color: const Color(0xFF262626),
                                                fontSize: 16.sp,
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.w600,
                                                height: 0,
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: (14 / 8).h,
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        const PlayerNameAndIcon(
                                            playerName: 'Praty Monster'),
                                        const PlayerNameAndIcon(
                                          playerName: 'Gannu Bhai',
                                        ),
                                        const PlayerNameAndIcon(
                                            playerName: 'Salvatore'),
                                        const PlayerNameAndIcon(
                                          playerName: 'Aussie Dorm',
                                        ),
                                        Text(
                                          '+6 others',
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
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                ],
              ),
            ),
          ),
          bottomNavigationBar: Container(
            width: 100.w,
            height: (71 / 8).h,
            padding:
                EdgeInsets.symmetric(vertical: (12 / 8).h, horizontal: 2.h),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(
                left: const BorderSide(color: Color(0xFFD9D9D9)),
                top: const BorderSide(color: Color(0xFFD9D9D9)),
                right: const BorderSide(color: Color(0xFFD9D9D9)),
                bottom: BorderSide(
                    width: (1 / 3.6).w, color: const Color(0xFFD9D9D9)),
              ),
              boxShadow: const [
                BoxShadow(
                  color: Color(0x14000000),
                  blurRadius: 16,
                  offset: Offset(0, -8),
                  spreadRadius: 0,
                )
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                FittedBox(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '₹ 250',
                        style: TextStyle(
                          color: const Color(0xFF262626),
                          fontSize: 22.sp,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(
                        height: 0.5.h,
                      ),
                      Text(
                        'MON-12, 6am-7am ',
                        style: TextStyle(
                          color: const Color(0xFF238F20),
                          fontSize: 8.5.sp,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  decoration: ShapeDecoration(
                    color: const Color(0xFF238F20),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(1.h)),
                    shadows: const [
                      BoxShadow(
                        color: Color(0x28000000),
                        blurRadius: 6,
                        offset: Offset(0, 2),
                        spreadRadius: 0,
                      )
                    ],
                  ),
                  child: CustomButton(
                    text: 'Reserve',
                    fontSize: 10.sp,
                    callback: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ConfirmBookingPage()),
                      );
                    },
                    height: (36 / 8).h,
                    width: (102 / 3.6).w,
                    color: const Color(0xFF238F20),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
