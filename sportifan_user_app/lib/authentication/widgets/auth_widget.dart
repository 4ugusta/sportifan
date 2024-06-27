import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sportifan_user/widgets/custom_proceed_button.dart';
import 'package:sizer/sizer.dart';

String? time = "00:20";

class AuthWidget extends StatelessWidget {
  final String mainText;
  final String secMainText;
  final TextEditingController controller;
  final Function() callback;
  final String hintText;
  final TextInputType inputType;
  final bool? isOtpScreen;
  final VoidCallback? onEdit;

  const AuthWidget({
    super.key,
    required this.mainText,
    required this.secMainText,
    required this.controller,
    required this.callback,
    required this.hintText,
    required this.inputType,
    this.isOtpScreen,
    this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: (300 / 8).h,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 2.h, vertical: 2.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  mainText,
                  style: TextStyle(
                    color: const Color(0xFF262626),
                    fontSize: 13.sp,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                    height: 0,
                  ),
                ),
                SizedBox(
                  height: 1.h,
                ),
                Row(
                  children: [
                    Text(
                      secMainText,
                      style: TextStyle(
                        color: const Color(0xFF727272),
                        fontSize: 10.sp,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                    SizedBox(
                      width: (12 / 3.6).w,
                    ),
                    isOtpScreen == true
                        ? Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 1.5.h, vertical: 0.5.h),
                            child: GestureDetector(
                              onTap: onEdit,
                              child: Text(
                                'Edit',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: const Color(0xFF238F20),
                                  fontSize: 8.5.sp,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w500,
                                  height: 0,
                                ),
                              ),
                            ),
                          )
                        : const SizedBox()
                  ],
                ),
                SizedBox(
                  height: (20 / 8).h,
                ),
                SizedBox(
                  height: (38 / 8).h,
                  child: TextField(
                    keyboardType: inputType,
                    controller: controller,
                    cursorColor: const Color(0xFFB5B5B5),
                    decoration: InputDecoration(
                      hintText: hintText,
                      hintStyle: TextStyle(
                        color: const Color(0xFFB5B5B5),
                        fontSize: 12.sp,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: 1.5.h, vertical: (7 / 8).h),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: const Color(0xFF238F20), width: (1 / 8).h),
                        borderRadius: BorderRadius.circular(1.h),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: const Color(0xFF238F20), width: (1 / 8).h),
                        borderRadius: BorderRadius.circular(1.h),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: (20 / 8).h,
                ),
                isOtpScreen == true
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Try again after $time",
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
                                vertical: 0.5.h, horizontal: 1.5.h),
                            child: Text(
                              "Retry",
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
                      )
                    : const SizedBox(),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(bottom: 3.h),
              child: CustomButton(
                text: "Proceed",
                callback: callback,
                height: 6.h,
                width: 100.w - (32 / 3.6).w,
                color: const Color(0xFF238F20),
                fontSize: 13.sp,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
