import 'package:flutter/material.dart';
import 'package:sportifan_user/widgets/notification_card.dart';
import 'package:sizer/sizer.dart';

// Responsiveness is added to the widget

class SideBar extends StatelessWidget {
  final bool notificationExists;
  final Map<String, VoidCallback> onTapFunctions;
  const SideBar(
      {super.key,
      required this.notificationExists,
      required this.onTapFunctions});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color(0xFFFAFAFA),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(0),
          bottomRight: Radius.circular(0),
        ),
      ),
      width: (244 / 3.6).w,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 3.h, horizontal: 2.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Notifications',
              style: TextStyle(
                color: const Color(0xFF262626),
                fontSize: 16.sp,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
                height: 0,
              ),
            ),
            notificationExists
                ? Column(
                    children: [
                      SizedBox(
                        height: (20 / 8).h,
                      ),
                      NotificationCard(
                        field: 'Highlights',
                        notificationIcon: Icons.sports_cricket,
                        onTap: onTapFunctions['Highlights']!,
                      ),
                      NotificationCard(
                        field: 'Stats',
                        notificationIcon: Icons.graphic_eq,
                        onTap: onTapFunctions['Stats']!,
                      ),
                    ],
                  )
                : Row(
                    children: [
                      SizedBox(
                        width: (12 / 3.6).w,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: (34 / 8).h,
                          ),
                          SizedBox(
                            width: (187.48 / 3.6).w,
                            height: (141.10 / 8).h,
                            child: Image.asset(
                              'assets/images/empty_notifications.png',
                              fit: BoxFit.fill,
                            ),
                          ),
                          SizedBox(
                            height: 3.h,
                          ),
                          Text(
                            'You Have No New Notifications ',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: const Color(0xFF727272),
                              fontSize: 10.sp,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                              height: 0,
                            ),
                          )
                        ],
                      ),
                    ],
                  )
          ],
        ),
      ),
    );
  }
}
