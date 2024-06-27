import 'package:flutter/material.dart';
import 'package:sportifan_user/screens/main/highlights/key_moment.dart';
import 'package:sizer/sizer.dart';

class HighlightsWidget extends StatelessWidget {
  final bool? lastMatchTag;
  const HighlightsWidget({super.key, this.lastMatchTag});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const KeyMoment(),
          ),
        );
      },
      child: Padding(
        padding: EdgeInsets.only(bottom: 2.h),
        child: Container(
          width: 100.w - (32 / 3.6).w,
          height: 11.h,
          padding: EdgeInsets.all(1.5.h),
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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: (64 / 8).h,
                    height: (64 / 8).h,
                    decoration: ShapeDecoration(
                      color: Colors.black.withOpacity(0.10000000149011612),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0.5.h)),
                    ),
                    child: Image.asset(
                      'assets/images/highlights_img.png',
                      width: (64 / 8).h,
                      height: (64 / 8).h,
                    ),
                  ),
                  SizedBox(
                    width: (12 / 3.6).w,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: (150 / 3.6).w,
                        child: Text(
                          'KKR vs CSK  ',
                          style: TextStyle(
                            color: const Color(0xFF262626),
                            fontSize: 12.sp,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                            height: 0,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: (14 / 8).h,
                            height: (14 / 8).h,
                            decoration: ShapeDecoration(
                              color: const Color.fromRGBO(251, 196, 1, 1),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(2.h)),
                            ),
                            child: Icon(
                              Icons.star,
                              size: (12 / 8).h,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                            width: (4 / 3.6).w,
                          ),
                          SizedBox(
                            width: (106 / 3.6).w,
                            child: Text(
                              'Montage',
                              style: TextStyle(
                                color: const Color(0xFF727272),
                                fontSize: 8.5.sp,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w600,
                                height: 0,
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  )
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  lastMatchTag == true
                      ? Text(
                          'Last Match',
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            color: const Color(0xFF238F20),
                            fontSize: 10.sp,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                          ),
                        )
                      : const SizedBox(),
                  SizedBox(
                    height: 0.5.h,
                  ),
                  SizedBox(
                    width: (66 / 3.6).w,
                    child: Text(
                      '12 Feb 2024',
                      textAlign: TextAlign.right,
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
            ],
          ),
        ),
      ),
    );
  }
}
