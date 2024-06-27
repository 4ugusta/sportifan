import 'package:flutter/material.dart';
import 'package:sportifan_user/widgets/player.dart';
import 'package:sizer/sizer.dart';

class AddPlayer extends StatelessWidget {
  final TextEditingController playerNameController;
  final TextEditingController ageController;
  final void Function(Player) onAdd;
  const AddPlayer({
    super.key,
    required this.playerNameController,
    required this.ageController,
    required this.onAdd,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 2.h, right: 2.h, left: 2.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: (229 / 3.6).w,
            height: (34 / 8).h,
            child: TextField(
              textAlign: TextAlign.left,
              controller: playerNameController,
              cursorColor: const Color(0xFFB5B5B5),
              decoration: InputDecoration(
                hintText: 'Player 1',
                hintStyle: TextStyle(
                  color: const Color(0xFFB5B5B5),
                  fontSize: 10.sp,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                  height: 0,
                ),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 2.3.h, horizontal: 1.h),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: const Color(0xFFBDDEBD), width: (1 / 8).h),
                  borderRadius: BorderRadius.circular(1.h),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: const Color(0xFFBDDEBD), width: (1 / 8).h),
                  borderRadius: BorderRadius.circular(1.h),
                ),
              ),
            ),
          ),
          SizedBox(
            width: (8 / 3.6).w,
          ),
          SizedBox(
            width: (58 / 3.6).w,
            height: (34 / 8).h,
            child: TextField(
              textAlign: TextAlign.left,
              controller: ageController,
              cursorColor: const Color(0xFFB5B5B5),
              decoration: InputDecoration(
                hintText: 'Age',
                hintStyle: TextStyle(
                  color: const Color(0xFFB5B5B5),
                  fontSize: 10.sp,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                  height: 0,
                ),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 2.3.h, horizontal: 1.h),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: const Color(0xFFBDDEBD), width: (1 / 8).h),
                  borderRadius: BorderRadius.circular(1.h),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: const Color(0xFFBDDEBD), width: (1 / 8).h),
                  borderRadius: BorderRadius.circular(1.h),
                ),
              ),
            ),
          ),
          SizedBox(
            width: (12 / 3.6).w,
          ),
          GestureDetector(
            onTap: () {
              onAdd(Player(
                name: playerNameController.text,
                age: int.parse(ageController.text),
              ));
            },
            child: Text(
              'Add',
              style: TextStyle(
                color: const Color(0xFF238F20),
                fontSize: 8.5.sp,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
                height: 0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
