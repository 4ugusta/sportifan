import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sportifan_user/screens/main/profile.dart';
import 'package:sizer/sizer.dart';

final searchQueryProvider = StateProvider<String>((ref) => '');

class TopNavigationBar extends ConsumerWidget {
  final TextEditingController controller;
  final VoidCallback onNotificationIconTapped;
  final ValueChanged<String> onSearchChanged;
  const TopNavigationBar({
    super.key,
    required this.controller,
    required this.onNotificationIconTapped,
    required this.onSearchChanged,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      width: screenWidth,
      height: (68 / 8).h,
      decoration: ShapeDecoration(
        color: const Color(0xFF238F20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(3.h),
            bottomRight: Radius.circular(3.h),
          ),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.only(
            left: 2.h, right: 2.h, top: 2.h, bottom: (14 / 8).h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: onNotificationIconTapped,
              child: Container(
                width: 4.h,
                height: 4.h,
                padding: EdgeInsets.all((6 / 8).h),
                decoration: ShapeDecoration(
                  color: Colors.transparent,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0.25.h)),
                ),
                child: Icon(
                  Icons.notifications,
                  size: 3.h,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(width: (14 / 3.6).w),
            SizedBox(
              height: (38 / 8).h,
              width: (228 / 3.6).w,
              // color: Colors.white,
              child: TextField(
                controller: controller,
                onChanged: (query) {
                  onSearchChanged(query);
                  ref.read(searchQueryProvider.notifier).state = query;
                },
                cursorColor: const Color(0xFFB5B5B5),
                textAlign: TextAlign.left,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: "Search Venue, Highlights",
                  hintStyle: TextStyle(
                    color: const Color(0xFFB5B5B5),
                    fontSize: 12.sp,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                  contentPadding: EdgeInsets.symmetric(
                      vertical: (7.0 / 8).h, horizontal: 4.h),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Color(0xFF238F20)),
                    borderRadius: BorderRadius.circular(3.h),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Color(0xFF238F20)),
                    borderRadius: BorderRadius.circular(3.h),
                  ),
                ),
              ),
            ),
            SizedBox(width: (14 / 3.6).w),
            GestureDetector(
              onTap: () {
                if (!(ModalRoute.of(context)?.settings.name ==
                    '/ProfileView')) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProfileView(),
                      settings: const RouteSettings(name: '/ProfileView'),
                    ),
                  );
                }
              },
              child: Container(
                  width: (36 / 8).h,
                  height: (36 / 8).h,
                  decoration: const ShapeDecoration(
                    color: Color(0xFFD9D9D9),
                    shape: OvalBorder(),
                  ),
                  child: Image.asset(
                    'assets/Profile/Icon/user-profile.png',
                    fit: BoxFit.contain,
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
