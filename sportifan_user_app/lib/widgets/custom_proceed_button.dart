import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Function() callback;
  final double height;
  final double width;
  final Color color;
  final double? fontSize;

  const CustomButton({
    super.key,
    required this.text,
    required this.callback,
    required this.height, // default value
    required this.width, // default value
    required this.color,
    this.fontSize, // default value
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            elevation: 0,
            backgroundColor: color,
            minimumSize: Size(width, height),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(1.h)))),
        onPressed: () => callback(),
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: fontSize ?? 13.sp,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w600,
            height: 0,
          ),
        ),
      ),
    );
  }
}
