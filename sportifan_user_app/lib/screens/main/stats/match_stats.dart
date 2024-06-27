import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sportifan_user/widgets/player_stats.dart';

class MatchStats extends StatefulWidget {
  const MatchStats({super.key});

  @override
  State<MatchStats> createState() => _MatchStatsState();
}

class _MatchStatsState extends State<MatchStats> {
  bool _isExpanded1 = false;
  bool _isExpanded2 = false;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(top: 24.0),
        child: Align(
          alignment: Alignment.topCenter,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'KKR won this match by 23 runs',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF727272),
                  fontSize: 14,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                  height: 0,
                ),
              ),
              SizedBox(height: 11),
              Container(
                width: screenWidth - 32,
                // height: 272,
                decoration: ShapeDecoration(
                  color: Color(0xFFFDEDB3),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: 72,
                              height: 72,
                              decoration: ShapeDecoration(
                                image: DecorationImage(
                                  image:
                                      AssetImage('assets/images/TeamIcon.png'),
                                  fit: BoxFit.cover,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                shadows: [
                                  BoxShadow(
                                    color: Color.fromARGB(40, 149, 144, 144),
                                    blurRadius: 6,
                                    offset: Offset(0, 2),
                                    spreadRadius: 0,
                                  )
                                ],
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              'KKR',
                              style: TextStyle(
                                color: Color(0xFF262626),
                                fontSize: 16,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w600,
                                height: 0,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              '223/10*',
                              style: TextStyle(
                                color: Color(0xFF727272),
                                fontSize: 14,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500,
                                height: 0,
                              ),
                            )
                          ],
                        ),
                        Text(
                          'VS',
                          style: TextStyle(
                            color: Color(0x19262626),
                            fontSize: 40,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w700,
                            height: 0,
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: 72,
                              height: 72,
                              decoration: ShapeDecoration(
                                image: DecorationImage(
                                  image:
                                      AssetImage('assets/images/TeamIcon2.png'),
                                  fit: BoxFit.cover,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                shadows: [
                                  BoxShadow(
                                    color: Color.fromARGB(40, 149, 144, 144),
                                    blurRadius: 6,
                                    offset: Offset(0, 2),
                                    spreadRadius: 0,
                                  )
                                ],
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              'CSR',
                              style: TextStyle(
                                color: Color(0xFF262626),
                                fontSize: 16,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w600,
                                height: 0,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              '200/10*',
                              style: TextStyle(
                                color: Color(0xFF727272),
                                fontSize: 14,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500,
                                height: 0,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Divider(
                      color: Color.fromRGBO(189, 222, 189, 1),
                      thickness: 1,
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Man of the match',
                          style: TextStyle(
                            color: Color(0xFF727272),
                            fontSize: 12,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                            height: 0,
                          ),
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/Profile/Icon/user-profile2.png',
                              width: 24,
                              height: 24,
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Text(
                              'Praty Monster',
                              style: TextStyle(
                                color: Color(0xFF262626),
                                fontSize: 12,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500,
                                height: 0,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: 16,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 24,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 36,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                    decoration: BoxDecoration(color: Color(0xFFFDEDB3)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'KKR (1st Innings) ',
                          style: TextStyle(
                            color: _isExpanded1
                                ? Color(0xFF262626)
                                : Color(0xFF727272),
                            fontSize: 12,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                            height: 0,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              '223(10 Ovs)',
                              style: TextStyle(
                                color: _isExpanded1
                                    ? Color(0xFF262626)
                                    : Color(0xFF727272),
                                fontSize: 12,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w600,
                                height: 0,
                              ),
                            ),
                            SizedBox(width: 4),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment
                                  .start, // Aligns children to the start
                              children: [
                                GestureDetector(
                                  child: Icon(
                                    _isExpanded1
                                        ? Icons.arrow_drop_up_outlined
                                        : Icons.arrow_drop_down_outlined,
                                    color: Color.fromRGBO(35, 143, 32, 1),
                                  ),
                                  onTap: () {
                                    setState(() {
                                      _isExpanded1 = !_isExpanded1;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Visibility(
                    visible: _isExpanded1,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 8,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'BATTER',
                                style: TextStyle(
                                  color: Color(0xFF727272),
                                  fontSize: 10,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w600,
                                  height: 0,
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: 24,
                                    child: Text(
                                      'R',
                                      textAlign: TextAlign.right,
                                      style: TextStyle(
                                        color: Color(0xFF727272),
                                        fontSize: 10,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w600,
                                        height: 0,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 16,
                                  ),
                                  SizedBox(
                                    width: 16,
                                    child: Text(
                                      'B',
                                      textAlign: TextAlign.right,
                                      style: TextStyle(
                                        color: Color(0xFF727272),
                                        fontSize: 10,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w600,
                                        height: 0,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 16,
                                  ),
                                  SizedBox(
                                    width: 16,
                                    child: Text(
                                      '4s',
                                      textAlign: TextAlign.right,
                                      style: TextStyle(
                                        color: Color(0xFF727272),
                                        fontSize: 10,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w600,
                                        height: 0,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 16,
                                  ),
                                  SizedBox(
                                    width: 16,
                                    child: Text(
                                      '6s',
                                      textAlign: TextAlign.right,
                                      style: TextStyle(
                                        color: Color(0xFF727272),
                                        fontSize: 10,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w600,
                                        height: 0,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 16,
                                  ),
                                  SizedBox(
                                    width: 32,
                                    child: Text(
                                      'Sr',
                                      textAlign: TextAlign.right,
                                      style: TextStyle(
                                        color: Color(0xFF727272),
                                        fontSize: 10,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w600,
                                        height: 0,
                                      ),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          PlayerStats(),
                          PlayerStats(),
                          PlayerStats(),
                          PlayerStats(),
                          PlayerStats(),
                          PlayerStats(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'TOTAL',
                                    style: TextStyle(
                                      color: Color(0xFF262626),
                                      fontSize: 12,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w600,
                                      height: 0,
                                    ),
                                  ),
                                  SizedBox(height: 2),
                                  Text(
                                    '10 Ovs (RR : 3.66)',
                                    style: TextStyle(
                                      color: Color(0xFFB5B5B5),
                                      fontSize: 10,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w600,
                                      height: 0,
                                    ),
                                  )
                                ],
                              ),
                              Container(
                                width: 168,
                                height: 18,
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      width: 24,
                                      child: Text(
                                        '223',
                                        textAlign: TextAlign.right,
                                        style: TextStyle(
                                          color: Color(0xFF262626),
                                          fontSize: 12,
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w600,
                                          height: 0,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 8,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 36,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                    decoration: BoxDecoration(color: Color(0xFFBDDEBD)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'CSK (2nd Innings) ',
                          style: TextStyle(
                            color: _isExpanded2
                                ? Color(0xFF262626)
                                : Color(0xFF727272),
                            fontSize: 12,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                            height: 0,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              '200(10 Ovs)',
                              style: TextStyle(
                                color: _isExpanded2
                                    ? Color(0xFF262626)
                                    : Color(0xFF727272),
                                fontSize: 12,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w600,
                                height: 0,
                              ),
                            ),
                            SizedBox(width: 4),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment
                                  .start, // Aligns children to the start
                              children: [
                                GestureDetector(
                                  child: Icon(
                                    _isExpanded2
                                        ? Icons.arrow_drop_up_outlined
                                        : Icons.arrow_drop_down_outlined,
                                    color: Color.fromRGBO(35, 143, 32, 1),
                                  ),
                                  onTap: () {
                                    setState(() {
                                      _isExpanded2 = !_isExpanded2;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Visibility(
                    visible: _isExpanded2,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 8,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'BATTER',
                                style: TextStyle(
                                  color: Color(0xFF727272),
                                  fontSize: 10,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w600,
                                  height: 0,
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: 24,
                                    child: Text(
                                      'R',
                                      textAlign: TextAlign.right,
                                      style: TextStyle(
                                        color: Color(0xFF727272),
                                        fontSize: 10,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w600,
                                        height: 0,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 16,
                                  ),
                                  SizedBox(
                                    width: 16,
                                    child: Text(
                                      'B',
                                      textAlign: TextAlign.right,
                                      style: TextStyle(
                                        color: Color(0xFF727272),
                                        fontSize: 10,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w600,
                                        height: 0,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 16,
                                  ),
                                  SizedBox(
                                    width: 16,
                                    child: Text(
                                      '4s',
                                      textAlign: TextAlign.right,
                                      style: TextStyle(
                                        color: Color(0xFF727272),
                                        fontSize: 10,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w600,
                                        height: 0,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 16,
                                  ),
                                  SizedBox(
                                    width: 16,
                                    child: Text(
                                      '6s',
                                      textAlign: TextAlign.right,
                                      style: TextStyle(
                                        color: Color(0xFF727272),
                                        fontSize: 10,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w600,
                                        height: 0,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 16,
                                  ),
                                  SizedBox(
                                    width: 32,
                                    child: Text(
                                      'Sr',
                                      textAlign: TextAlign.right,
                                      style: TextStyle(
                                        color: Color(0xFF727272),
                                        fontSize: 10,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w600,
                                        height: 0,
                                      ),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          PlayerStats(),
                          PlayerStats(),
                          PlayerStats(),
                          PlayerStats(),
                          PlayerStats(),
                          PlayerStats(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'TOTAL',
                                    style: TextStyle(
                                      color: Color(0xFF262626),
                                      fontSize: 12,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w600,
                                      height: 0,
                                    ),
                                  ),
                                  SizedBox(height: 2),
                                  Text(
                                    '10 Ovs (RR : 3.66)',
                                    style: TextStyle(
                                      color: Color(0xFFB5B5B5),
                                      fontSize: 10,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w600,
                                      height: 0,
                                    ),
                                  )
                                ],
                              ),
                              Container(
                                width: 168,
                                height: 18,
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      width: 24,
                                      child: Text(
                                        '223',
                                        textAlign: TextAlign.right,
                                        style: TextStyle(
                                          color: Color(0xFF262626),
                                          fontSize: 12,
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w600,
                                          height: 0,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 8,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
