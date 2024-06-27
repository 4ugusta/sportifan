import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sportifan_user/widgets/stats_widget.dart';

class IndividualStats extends StatelessWidget {
  const IndividualStats({super.key});

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
              Container(
                width: screenWidth - 32,
                height: 104,
                decoration: ShapeDecoration(
                  color: Color(0xFFFDEDB3),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16),
                    ),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(width: 24),
                    Container(
                      width: 72,
                      height: 72,
                      decoration: ShapeDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                              'assets/Profile/Icon/user-profile3.png'),
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
                    SizedBox(width: 16),
                    Expanded(
                      // Add this
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 34),
                          Text(
                            'Party Monster',
                            style: TextStyle(
                              color: Color(0xFF262626),
                              fontSize: 20,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w600,
                              height: 0,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'Man Of The Match',
                            style: TextStyle(
                              color: Color(0xFF238F20),
                              fontSize: 10,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w300,
                              height: 0,
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              StatsWidget(
                statName: 'Runs Scored',
                statValue: 32,
                color: Color(0xFFFDEDB3),
              ),
              StatsWidget(
                statName: 'Innings runs scored',
                statValue: 32,
                color: Color(0xFFBDDEBD),
              ),
              StatsWidget(
                statName: 'Batting Avg',
                statValue: 32,
                color: Color(0xFFFDEDB3),
              ),
              StatsWidget(
                statName: 'Bowling Avg',
                statValue: 32,
                color: Color(0xFFBDDEBD),
              ),
              StatsWidget(
                statName: 'Number ball faced',
                statValue: 32,
                color: Color(0xFFFDEDB3),
              ),
              StatsWidget(
                statName: 'Number of ball bowled',
                statValue: 32,
                color: Color(0xFFBDDEBD),
              ),
              StatsWidget(
                statName: 'Bowling strike rate',
                statValue: 32,
                color: Color(0xFFFDEDB3),
              ),
              StatsWidget(
                statName: 'Batting strike rate',
                statValue: 32,
                color: Color(0xFFBDDEBD),
              ),
              StatsWidget(
                statName: 'Batting rating',
                statValue: 32,
                color: Color(0xFFFDEDB3),
              ),
              StatsWidget(
                statName: 'Bowling rating',
                statValue: 32,
                color: Color(0xFFBDDEBD),
              ),
              StatsWidget(
                statName: 'Bowling economy',
                statValue: 32,
                color: Color(0xFFFDEDB3),
              ),
              StatsWidget(
                statName: 'Player rating',
                statValue: 32,
                color: Color(0xFFBDDEBD),
              ),
              StatsWidget(
                statName: 'Number of MOM',
                statValue: 32,
                color: Color(0xFFFDEDB3),
              ),
              ClipRRect(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(16),
                  bottomRight: Radius.circular(16),
                ),
                child: StatsWidget(
                  statName: 'Number of MOS',
                  statValue: 32,
                  color: Color(0xFFBDDEBD),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
