import 'package:flutter/material.dart';
import 'package:sportifan_user/widgets/match_widget.dart';

class ChooseMatch extends StatelessWidget {
  final TextEditingController controller;
  const ChooseMatch({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Container(
        width: screenWidth,
        height: 300,
        decoration: BoxDecoration(
          color: Color.fromRGBO(248, 248, 248, 1),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Container(
                  width: 80,
                  height: 4,
                  decoration: ShapeDecoration(
                    color: Color(0xFFA9A9A9),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4)),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                padding: const EdgeInsets.only(left: 16, right: 16, top: 24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Choose Match',
                      style: TextStyle(
                        color: Color(0xFF262626),
                        fontSize: 16,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        height: 0,
                      ),
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    MatchWidget(),
                    MatchWidget(),
                    MatchWidget()
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
