import 'package:flutter/material.dart';

class StatsWidget extends StatelessWidget {
  final String statName;
  final int statValue;
  final Color color;
  const StatsWidget(
      {super.key,
      required this.statName,
      required this.statValue,
      required this.color});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      width: screenWidth - 32,
      height: 30,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      decoration: BoxDecoration(color: color),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            statName,
            style: TextStyle(
              color: Color(0xFF333333),
              fontSize: 12,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
              height: 0,
            ),
          ),
          const SizedBox(width: 158),
          Text(
            statValue.toString(),
            style: TextStyle(
              color: Color(0xFF262626),
              fontSize: 12,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
              height: 0,
            ),
          ),
        ],
      ),
    );
  }
}
