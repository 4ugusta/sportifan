import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class AddPlayerButton extends StatelessWidget {
  final VoidCallback onPressed;
  const AddPlayerButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.transparent),
        padding: MaterialStateProperty.all(EdgeInsets.zero),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 3.h,
            height: 3.h,
            child: Image.asset(
              'assets/images/+.png',
              fit: BoxFit.fill,
            ),
          ),
          SizedBox(
            width: 0.5.h,
          ),
          Text(
            'Add Player',
            style: TextStyle(
              color: const Color(0xFF238F20),
              fontSize: 8.5.sp,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
              height: 0,
            ),
          )
        ],
      ),
    );
  }
}
