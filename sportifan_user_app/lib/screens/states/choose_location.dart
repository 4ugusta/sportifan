import 'package:flutter/material.dart';

import 'package:sizer/sizer.dart';

class ChooseLocation extends StatelessWidget {
  final TextEditingController controller;
  const ChooseLocation({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: 100.w,
        height: (523 / 8).h,
        decoration: BoxDecoration(
          color: const Color.fromRGBO(248, 248, 248, 1),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(3.h),
            topRight: Radius.circular(3.h),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: EdgeInsets.only(top: 1.h),
                child: Container(
                  width: (80 / 3.6).w,
                  height: 0.5.h,
                  decoration: ShapeDecoration(
                    color: const Color(0xFFA9A9A9),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0.5.h),
                    ),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                padding: EdgeInsets.only(left: 2.h, right: 2.h, top: 3.h),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Choose your Location',
                      style: TextStyle(
                        color: const Color(0xFF262626),
                        fontSize: 13.sp,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        height: 0,
                      ),
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    SizedBox(
                      height: (38 / 8).h,
                      child: TextField(
                        controller: controller,
                        cursorColor: const Color(0xFFB5B5B5),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: "Search",
                          hintStyle: TextStyle(
                            color: const Color(0xFFB5B5B5),
                            fontSize: 13.sp,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                            height: 0,
                          ),
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 1.5.h,
                            vertical: (7 / 8).h,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: const Color(0xFF238F20),
                                width: (1 / 8).h),
                            borderRadius: BorderRadius.circular(1.h),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: const Color(0xFF238F20),
                                width: (1 / 8).h),
                            borderRadius: BorderRadius.circular(1.h),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 3.h,
                          height: 3.h,
                          child: Icon(
                            Icons.my_location_rounded,
                            size: 3.h,
                            color: const Color.fromRGBO(35, 143, 32, 1),
                          ),
                        ),
                        SizedBox(width: (12 / 3.6).w),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Use my current location',
                              style: TextStyle(
                                color: const Color(0xFF238F20),
                                fontSize: 13.sp,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w600,
                                height: 0,
                              ),
                            ),
                            SizedBox(
                              height: 0.5.h,
                            ),
                            Text(
                              'Grant location access to find nearby venues',
                              style: TextStyle(
                                color: const Color(0xFF727272),
                                fontSize: 10.sp,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w400,
                                height: 0,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 1.h),
                      child: Divider(
                        color: const Color.fromRGBO(189, 222, 189, 1),
                        thickness: (1 / 8).h,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(width: 10.w),
                        Text(
                          'Kolkata, West Bengal, India ',
                          style: TextStyle(
                            color: const Color(0xFF238F20),
                            fontSize: 13.sp,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                            height: 0,
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 1.h),
                      child: Divider(
                        color: const Color.fromRGBO(189, 222, 189, 1),
                        thickness: (1 / 8).h,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(width: 10.w),
                        Text(
                          'Bangalore, Karnataka, India',
                          style: TextStyle(
                            color: const Color(0xFF238F20),
                            fontSize: 13.sp,
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
            )
          ],
        ),
      ),
    );
  }
}
