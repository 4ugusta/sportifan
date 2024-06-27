import 'package:flutter/material.dart';

class PlayerStats extends StatelessWidget {
  const PlayerStats({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Container(
        width: screenWidth - 32,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Prat Monster',
                  style: TextStyle(
                    color: Color(0xFF262626),
                    fontSize: 10,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                    height: 0,
                  ),
                ),
                SizedBox(height: 2),
                Text(
                  'b Augie Sars',
                  style: TextStyle(
                    color: Color(0xFFB5B5B5),
                    fontSize: 10,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                    height: 0,
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 24,
                  child: Text(
                    '44',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: Color(0xFF262626),
                      fontSize: 10,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                      height: 0,
                    ),
                  ),
                ),
                SizedBox(width: 16),
                SizedBox(
                  width: 16,
                  child: Text(
                    '22',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: Color(0xFF727272),
                      fontSize: 10,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                ),
                SizedBox(width: 16),
                SizedBox(
                  width: 16,
                  child: Text(
                    '2',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: Color(0xFF727272),
                      fontSize: 10,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                ),
                SizedBox(width: 16),
                SizedBox(
                  width: 16,
                  child: Text(
                    '5',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: Color(0xFF727272),
                      fontSize: 10,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                ),
                SizedBox(width: 16),
                SizedBox(
                  width: 32,
                  child: Text(
                    '204',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: Color(0xFF727272),
                      fontSize: 10,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
