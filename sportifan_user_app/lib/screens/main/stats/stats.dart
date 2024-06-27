import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sportifan_user/constants/colors_all.dart';
import 'package:sportifan_user/screens/homeview.dart';
import 'package:sportifan_user/screens/states/choose_match.dart';
import 'package:sportifan_user/screens/main/stats/individual_stats.dart';
import 'package:sportifan_user/screens/main/stats/match_stats.dart';
import 'package:sportifan_user/screens/main/stats/win_loss_stats.dart';
import 'package:sportifan_user/widgets/custom_proceed_button.dart';
import 'package:sportifan_user/widgets/top_navigation_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class StatsView extends ConsumerStatefulWidget {
  final bool statsExists;
  const StatsView({super.key, required this.statsExists});

  @override
  ConsumerState<StatsView> createState() => _StatsViewState();
}

class _StatsViewState extends ConsumerState<StatsView>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFA),
      body: SafeArea(
        child: widget.statsExists
            ? Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // TopNavigationBar(
                  //   controller: controller,
                  //   onNotificationIconTapped: () {},
                  // ),
                  const SizedBox(
                    height: 16,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: GestureDetector(
                        onTap: () {
                          ref.read(counterProvider.notifier).update(0);
                        },
                        child: Icon(
                          Icons.navigate_before,
                          size: 24,
                          color: ColorsAll.greenCol,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Stats',
                          style: TextStyle(
                            color: Color(0xFF262626),
                            fontSize: 24,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                            height: 0,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {
                                showModalBottomSheet(
                                  context: context,
                                  builder: (context) {
                                    return ChooseMatch(
                                      controller: TextEditingController(),
                                    );
                                  },
                                );
                              },
                              child: Text(
                                'Last Match',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color(0xFF238F20),
                                  fontSize: 12,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w600,
                                  height: 0,
                                ),
                              ),
                            ),
                            SizedBox(width: 4),
                            Icon(
                              Icons.arrow_drop_down_outlined,
                              size: 24,
                              color: Color.fromRGBO(35, 143, 32, 1),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16),
                  Container(
                    width: screenWidth - 32,
                    child: TabBar(
                      labelStyle: TextStyle(
                        color: Color(0xFF238F20),
                        fontSize: 14,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                        height: 0,
                      ),
                      unselectedLabelStyle: TextStyle(
                        color: Color(0xFFB5B5B5),
                        fontSize: 14,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        height: 0,
                      ),
                      indicatorSize: TabBarIndicatorSize.tab,
                      indicatorColor: Color(0xFF238F20),
                      dividerColor: Color.fromRGBO(189, 222, 189, 100),
                      dividerHeight: 2,
                      controller: _tabController,
                      tabs: [
                        Tab(text: 'Match Stats'),
                        Tab(text: 'Individual'),
                        Tab(text: 'Win/Loss %'),
                      ],
                    ),
                  ),
                  Expanded(
                    child: TabBarView(
                      controller: _tabController,
                      children: [
                        MatchStats(),
                        IndividualStats(),
                        WinLossStats(),
                      ],
                    ),
                  ),
                ],
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0, left: 16.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.navigate_before,
                          size: 24,
                          color: ColorsAll.greenCol,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0, top: 16.0),
                    child: Text(
                      'Stats',
                      style: TextStyle(
                        color: Color(0xFF262626),
                        fontSize: 24,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                        height: 0,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Container(
                      width: screenWidth - 32,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 16,
                          ),
                          Container(
                            width: 212.18,
                            height: 169,
                            child: Image.asset(
                              'assets/images/empty_teams.png',
                              fit: BoxFit.contain,
                            ),
                          ),
                          SizedBox(
                            height: 32,
                          ),
                          Text(
                            'Oh So Empty !',
                            style: TextStyle(
                              color: Color(0xFFFF0000),
                              fontSize: 24,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w600,
                              height: 0,
                            ),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            'Create custom teams using phone number',
                            style: TextStyle(
                              color: Color(0xFF727272),
                              fontSize: 12,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w400,
                              height: 0,
                            ),
                          ),
                          SizedBox(
                            height: 32,
                          ),
                          CustomButton(
                            text: 'Create Team',
                            callback: () {},
                            height: 40,
                            width: screenWidth - 32,
                            color: Color(0xFF238F20),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
