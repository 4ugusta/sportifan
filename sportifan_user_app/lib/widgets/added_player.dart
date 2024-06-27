import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sizer/sizer.dart';

class AddedPlayer extends StatelessWidget {
  final int sNo;
  final String playerName;
  final int age;
  final void Function() onDelete;
  const AddedPlayer({
    super.key,
    required this.sNo,
    required this.playerName,
    required this.age,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 1.5.h, vertical: 1.5.h),
      child: Container(
        alignment: Alignment.centerLeft,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: SizedBox(
                width: 100.w * 0.5,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      '$sNo.',
                      style: TextStyle(
                        color: const Color(0xFF262626),
                        fontSize: 10.sp,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                        height: 0,
                      ),
                    ),
                    SizedBox(width: (8 / 3.6).w),
                    SizedBox(
                      child: Image.asset(
                        'assets/Profile/Icon/user-profile.png',
                        width: 3.h,
                        height: 3.h,
                      ),
                    ),
                    SizedBox(width: (8 / 3.6).w),
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: '$playerName ',
                            style: TextStyle(
                              color: const Color(0xFF262626),
                              fontSize: 10.sp,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                              height: 0,
                            ),
                          ),
                          TextSpan(
                            text: '($age)',
                            style: TextStyle(
                              color: const Color(0xFF727272),
                              fontSize: 10.sp,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                              height: 0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: 3.h,
              height: 3.h,
              decoration: ShapeDecoration(
                color: const Color(0xFFFDEDB3),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0.25.h)),
              ),
              child: IconButton(
                style: ButtonStyle(
                  padding: MaterialStateProperty.all(EdgeInsets.zero),
                  iconSize: MaterialStateProperty.all(3.h),
                ),
                icon: Icon(
                  Icons.delete,
                  size: 3.h,
                  color: const Color.fromRGBO(35, 143, 32, 1),
                ),
                onPressed: () {
                  onDelete();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
