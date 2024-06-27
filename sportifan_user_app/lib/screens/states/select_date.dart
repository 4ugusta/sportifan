import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sportifan_user/widgets/custom_proceed_button.dart';
import 'package:sportifan_user/widgets/text_tile.dart';
import 'package:sizer/sizer.dart';

class SelectDate extends StatefulWidget {
  final Function(String, String, BuildContext) callback;
  const SelectDate({super.key, required this.callback});

  @override
  State<SelectDate> createState() => _SelectDateState();
}

class _SelectDateState extends State<SelectDate> {
  String selectedDate = 'Mon - 12 Feb';
  String selectedTime = '6am - 7am';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
      width: 100.w,
      height: (280 / 8).h,
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
                      borderRadius: BorderRadius.circular(0.5.h)),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              padding: EdgeInsets.only(top: 4.h),
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
                              isSelected: selectedDate == 'Mon - 12 Feb',
                              onTap: () {
                                setState(() {
                                  selectedDate = 'Mon - 12 Feb';
                                });
                              },
                            ),
                            TextTile(
                              tilename: 'Tue - 13 Feb',
                              isSelected: selectedDate == 'Tue - 13 Feb',
                              onTap: () {
                                setState(() {
                                  selectedDate = 'Tue - 13 Feb';
                                });
                              },
                            ),
                            TextTile(
                              tilename: 'Wed - 14 Feb',
                              isSelected: selectedDate == 'Wed - 14 Feb',
                              onTap: () {
                                setState(() {
                                  selectedDate = 'Wed - 14 Feb';
                                });
                              },
                            ),
                            TextTile(
                              tilename: 'Thu - 15 Feb',
                              isSelected: selectedDate == 'Thu - 15 Feb',
                              onTap: () {
                                setState(() {
                                  selectedDate = 'Thu - 15 Feb';
                                });
                              },
                            ),
                            TextTile(
                              tilename: 'Fri - 15 Feb',
                              isSelected: selectedDate == 'Fri - 15 Feb',
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
            height: 4.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 2.h),
            child: CustomButton(
              text: "Proceed",
              callback: () {
                widget.callback(selectedDate, selectedTime, context);
                Navigator.pop(context);
              },
              height: 6.h,
              width: 100.w - (32 / 3.6).w,
              color: const Color(0xFF238F20),
              fontSize: 13.sp,
            ),
          )
        ],
      ),
    ));
  }
}
