import 'package:flutter/material.dart';
import 'package:sportifan_user/screens/main/teams/your_teams.dart';
import 'package:sizer/sizer.dart';

class TeamCard extends StatelessWidget {
  final VoidCallback onEdit;
  final String iconName;
  final VoidCallback onDelete;

  const TeamCard(
      {super.key,
      required this.iconName,
      required this.onDelete,
      required this.onEdit});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 1.5.h),
      child: Container(
        width: 100.w - (32 / 3.6).w,
        height: (74 / 8).h,
        padding: EdgeInsets.symmetric(horizontal: 2.h, vertical: 1.h),
        decoration: ShapeDecoration(
          color: Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(1.h)),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: (58 / 8).h,
              height: (58 / 8).h,
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
            SizedBox(
              width: (13 / 3.6).w,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'KKR',
                  style: TextStyle(
                    color: const Color(0xFF262626),
                    fontSize: 13.sp,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                    height: 0,
                  ),
                ),
                Text(
                  '12 players',
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
            const Spacer(),
            GestureDetector(
              onTap: onEdit,
              child: Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: 1.5.h, vertical: 0.5.h),
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
            ),
            SizedBox(
              width: (20 / 3.6).w,
            ),
            Container(
              width: 3.h,
              height: 3.h,
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0.25.h)),
              ),
              child: GestureDetector(
                onTap: () async {
                  bool shouldDelete = await deleteDialog(context);
                  if (shouldDelete) {
                    onDelete();
                  }
                },
                child: Icon(
                  Icons.delete,
                  size: 3.h,
                  color: const Color.fromRGBO(35, 143, 32, 1),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
