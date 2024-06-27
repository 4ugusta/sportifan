import 'package:flutter/material.dart';
import 'package:sportifan_user/widgets/custom_proceed_button.dart';
import 'package:sizer/sizer.dart';

class AddName extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final Function() callback;
  const AddName(
      {super.key,
      required this.controller,
      required this.hintText,
      required this.callback});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: (300 / 8).h,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.all(2.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Enter your Profile name',
                  style: TextStyle(
                    color: const Color(0xFF262626),
                    fontSize: 13.sp,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                    height: 0,
                  ),
                ),
                SizedBox(
                  height: (20 / 8).h,
                ),
                SizedBox(
                  height: (38 / 8).h,
                  child: TextField(
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
