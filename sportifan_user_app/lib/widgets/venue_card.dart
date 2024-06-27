import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sportifan_user/models/venue.dart';
import 'package:sportifan_user/screens/main/booking/venue_screen.dart';
import 'package:sizer/sizer.dart';

class VenueCard extends StatelessWidget {
  final Venue venue;
  final String rating;
  final String venueName;
  final String pricing;
  final String location;
  final String distance;
  const VenueCard({
    super.key,
    required this.rating,
    required this.venueName,
    required this.pricing,
    required this.location,
    required this.distance,
    required this.venue,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => VenueScreen(venue)),
        );
      },
      child: Padding(
        padding: EdgeInsets.only(bottom: 2.h),
        child: Container(
          width: (328 / 3.6).w,
          height: (166 / 8).h,
          padding: EdgeInsets.all(1.h),
          decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(1.h)),
            shadows: const [
              BoxShadow(
                color: Color(0x28000000),
                blurRadius: 2,
                offset: Offset(0, 1),
                spreadRadius: 0,
              )
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: (96 / 8).h,
                child: Stack(
                  children: [
                    Positioned(
                      left: 0,
                      top: 0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: (312 / 3.6).w,
                            height: (96 / 8).h,
                            decoration: ShapeDecoration(
                              color: const Color(0xFFD9D9D9),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(0.5.h)),
                            ),
                            child: Image.asset(
                              'assets/images/VenueImage.png',
                              fit: BoxFit.fill,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      left: 6,
                      top: 8,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 0.5.h, vertical: (3 / 8).h),
                        decoration: ShapeDecoration(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(0.5.h)),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: (12 / 8).h,
                              height: (12 / 8).h,
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
                            SizedBox(width: (4 / 3.6).w),
                            Text(
                              rating,
                              style: TextStyle(
                                color: const Color(0xFF262626),
                                fontSize: 10.sp,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500,
                                height: 0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 1.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    venueName,
                    style: TextStyle(
                      color: const Color(0xFF262626),
                      fontSize: 12.sp,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      height: 0,
                    ),
                  ),
                  Text(
                    '₹ $pricing',
                    style: TextStyle(
                      color: const Color(0xFF262626),
                      fontSize: 14.sp,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      height: 0,
                    ),
                  )
                ],
              ),
              SizedBox(height: 0.5.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 2.h,
                        height: 2.h,
                        child: Icon(
                          Icons.location_on,
                          size: 2.h,
                          color: const Color.fromRGBO(115, 115, 115, 1),
                        ),
                      ),
                      SizedBox(width: (4 / 3.6).w),
                      Text(
                        location,
                        style: TextStyle(
                          color: const Color(0xFF727272),
                          fontSize: 8.sp,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                          height: 0,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    distance,
                    style: TextStyle(
                      color: const Color(0xFF727272),
                      fontSize: 10.sp,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                      height: 0,
                    ),
                  ),
                  Text(
                    'onwards',
                    style: TextStyle(
                      color: const Color(0xFF727272),
                      fontSize: 8.sp,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
