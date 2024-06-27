import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class NotificationCard extends StatelessWidget {
  final String field;
  final IconData notificationIcon;
  final VoidCallback onTap;

  const NotificationCard(
      {super.key,
      required this.field,
      required this.notificationIcon,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.only(bottom: 2.h),
        child: Container(
          width: (212 / 3.6).w,
          height: (92 / 8).h,
          padding: EdgeInsets.all(1.5.h),
          decoration: ShapeDecoration(
            color: const Color(0xFFFDEDB3),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(1.h),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    notificationIcon,
                    color: const Color(0xFF727272),
                    size: 3.h,
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  SizedBox(
                    width: (151 / 3.6).w,
                    child: Text(
                      'Your $field have been generated ',
                      style: TextStyle(
                        color: const Color(0xFF727272),
                        fontSize: 10.sp,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        height: 0,
                      ),
                    ),
                  )
                ],
              ),
              Icon(
                Icons.chevron_right_rounded,
                color: const Color.fromRGBO(35, 143, 32, 1),
                size: 3.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
