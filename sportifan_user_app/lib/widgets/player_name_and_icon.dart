import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class PlayerNameAndIcon extends StatelessWidget {
  final String playerName;
  const PlayerNameAndIcon({super.key, required this.playerName});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ((100.w - (32 / 3.6).w) * 0.7) / 2,
      padding: EdgeInsets.only(bottom: (9 / 8).h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            'assets/Profile/Icon/Default.png',
            width: 2.h,
            height: 2.h,
          ),
          SizedBox(
            width: (8 / 3.6).w,
          ),
          Text(
            playerName,
            style: TextStyle(
              color: const Color(0xFF727272),
              fontSize: 8.5.sp,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w400,
              height: 0,
            ),
          )
        ],
      ),
    );
  }
}
