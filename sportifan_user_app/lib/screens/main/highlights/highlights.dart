import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sportifan_user/constants/colors_all.dart';
import 'package:sportifan_user/screens/homeview.dart';
import 'package:sportifan_user/widgets/custom_proceed_button.dart';
import 'package:sportifan_user/widgets/highlights_widget.dart';
import 'package:sizer/sizer.dart';

class HighlightsView extends ConsumerWidget {
  final List<HighlightsWidget> highlights = [
    const HighlightsWidget(
      lastMatchTag: true,
    ),
    const HighlightsWidget(),
    const HighlightsWidget(),
    const HighlightsWidget(),
    const HighlightsWidget(),
    const HighlightsWidget(),
    const HighlightsWidget(),
    const HighlightsWidget(),
    const HighlightsWidget(),
  ];
  final bool highlightsExists;
  HighlightsView({
    super.key,
    required this.highlightsExists,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 2.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 2.h,
            ),
            GestureDetector(
              onTap: () {
                ref.read(counterProvider.notifier).update(0);
              },
              child: Icon(
                Icons.navigate_before,
                size: 3.h,
                color: ColorsAll.greenCol,
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            Text(
              'Highlights',
              style: TextStyle(
                color: const Color(0xFF262626),
                fontSize: 20.sp,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
                height: 0,
              ),
            ),
            SizedBox(
              height: 3.h,
            ),
            if (highlightsExists)
              ...highlights
            else
              SizedBox(
                width: 100.w - (32 / 3.6).w,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 1.h,
                    ),
                    SizedBox(
                      width: (212.18 / 3.6).w,
                      height: (169 / 8).h,
                      child: Image.asset(
                        'assets/images/empty_teams.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    Text(
                      'Oh So Empty !',
                      style: TextStyle(
                        color: const Color(0xFFFF0000),
                        fontSize: 20.sp,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                        height: 0,
                      ),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Text(
                      'Play a match and generate your highlights',
                      style: TextStyle(
                        color: const Color(0xFF727272),
                        fontSize: 10.sp,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    CustomButton(
                      text: 'Go to Bookings',
                      callback: () {},
                      height: (36 / 8).h,
                      width: 100.w - (32 / 3.6).w,
                      color: const Color(0xFF238F20),
                      fontSize: 10.sp,
                    )
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
