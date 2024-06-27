import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class TeamLogo extends StatelessWidget {
  final bool isActive;
  final String? teamNumber;
  final String iconName;
  const TeamLogo(
      {super.key,
      required this.isActive,
      required this.iconName,
      this.teamNumber});

  @override
  Widget build(BuildContext context) {
    return isActive
        ? Stack(
            children: [
              Container(
                height: 8.h,
                width: 8.h,
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                        width: (1.5 / 3.6).w, color: const Color(0xFF238F20)),
                    borderRadius: BorderRadius.circular((100 / 8).h),
                  ),
                ),
                child: Container(
                  width: 8.h,
                  height: 8.h,
                  decoration: ShapeDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/$iconName.png'),
                      fit: BoxFit.cover,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular((100 / 8).h),
                    ),
                    shadows: const [
                      BoxShadow(
                        color: Color.fromARGB(40, 163, 156, 156),
                        blurRadius: 6,
                        offset: Offset(0, 2),
                        spreadRadius: 0,
                      )
                    ],
                  ),
                ),
              ),
              teamNumber != null
                  ? Positioned(
                      right: 0,
                      top: 0,
                      child: Container(
                        width: 2.h,
                        height: 2.h,
                        decoration: const ShapeDecoration(
                          color: Color(0xFF238F20),
                          shape: OvalBorder(),
                        ),
                        child: Center(
                          child: Text(
                            teamNumber == '1' ? '1' : '2',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 8.5.sp,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                              height: 0,
                            ),
                          ),
                        ),
                      ),
                    )
                  : const SizedBox(),
            ],
          )
        : Container(
            width: 8.h,
            height: 8.h,
            decoration: ShapeDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/$iconName.png'),
                fit: BoxFit.cover,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular((100 / 8).h),
              ),
              shadows: const [
                BoxShadow(
                  color: Color.fromARGB(40, 163, 156, 156),
                  blurRadius: 6,
                  offset: Offset(0, 2),
                  spreadRadius: 0,
                )
              ],
            ),
          );
  }
}
