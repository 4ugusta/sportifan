import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class TextTile extends StatefulWidget {
  final String tilename;
  final bool isSelected;
  final VoidCallback onTap;

  const TextTile({
    super.key,
    required this.tilename,
    required this.onTap,
    required this.isSelected,
  });

  @override
  State<TextTile> createState() => _TextTileState();
}

class _TextTileState extends State<TextTile> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Padding(
        padding: EdgeInsets.only(right: 1.h),
        child: Container(
          padding: EdgeInsets.all(0.75.h),
          decoration: ShapeDecoration(
            color: widget.isSelected ? const Color(0xFF238F20) : Colors.white,
            shape: RoundedRectangleBorder(
                side: widget.isSelected
                    ? BorderSide.none
                    : BorderSide(
                        width: (1 / 3.6).w, color: const Color(0xFFD6D6D6)),
                borderRadius: BorderRadius.circular(0.75.h)),
            shadows: widget.isSelected
                ? [
                    const BoxShadow(
                      color: Color(0x28000000),
                      blurRadius: 6,
                      offset: Offset(0, 2),
                      spreadRadius: 0,
                    )
                  ]
                : [],
          ),
          child: widget.isSelected
              ? Center(
                  child: Text(
                    widget.tilename,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 8.5.sp,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                      height: 0,
                    ),
                  ),
                )
              : Center(
                  child: Text(
                    widget.tilename,
                    style: TextStyle(
                      color: const Color(0xFF727272),
                      fontSize: 8.5.sp,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}
