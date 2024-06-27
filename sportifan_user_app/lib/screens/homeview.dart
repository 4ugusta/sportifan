import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sportifan_user/screens/main/booking/bookings.dart';
import 'package:sportifan_user/screens/main/highlights/highlights.dart';
import 'package:sportifan_user/screens/main/stats/stats.dart';
import 'package:sportifan_user/screens/main/teams/your_teams.dart';
import 'package:sportifan_user/search/search_provider.dart' as search_provider;
import 'package:sportifan_user/widgets/sidebar.dart';
import 'package:sportifan_user/widgets/top_navigation_bar.dart';
import 'package:sizer/sizer.dart';

final counterProvider =
    StateNotifierProvider<CounterNotifier, int>((ref) => CounterNotifier());

class CounterNotifier extends StateNotifier<int> {
  CounterNotifier() : super(0);

  void update(int value) {
    state = value;
  }
}

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  ConsumerState<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  int currentIndex = 0;

  final List<Widget> _pages = [
    const BookingView(),
    const YourTeams(),
    HighlightsView(highlightsExists: true),
    const StatsView(statsExists: true),
  ];

  @override
  Widget build(BuildContext context) {
    void onTap(int index) {
      ref.read(counterProvider.notifier).update(index);
    }

    TextEditingController controller = TextEditingController();
    return Container(
      color: const Color(0xFF238F20),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: const Color(0xFFFAFAFA),
          key: _scaffoldKey,
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(9.h), // Set the height here
            child: TopNavigationBar(
              controller: controller,
              onNotificationIconTapped: () {
                _scaffoldKey.currentState?.openDrawer();
              },
              onSearchChanged: (query) {
                ref
                    .read(search_provider.searchQueryProvider.notifier)
                    .update(query);
              },
            ),
          ),
          drawer: SideBar(
            notificationExists: true,
            onTapFunctions: {
              'Highlights': () {
                ref.read(counterProvider.notifier).update(2);
                _scaffoldKey.currentState?.openEndDrawer();
              },
              'Stats': () {
                ref.read(counterProvider.notifier).update(3);
                _scaffoldKey.currentState?.openEndDrawer();
              },
            },
          ),
          body: IndexedStack(
            index: ref.watch(counterProvider),
            children: _pages,
          ),
          bottomNavigationBar: Theme(
            data: Theme.of(context).copyWith(
              canvasColor: Colors.white,
              primaryColor: const Color(0xFF238F20),
              bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                backgroundColor: Colors.white,
                elevation: 0,
              ),
            ),
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Color(0x28000000),
                    blurRadius: 16,
                    offset: Offset(0, -8),
                    spreadRadius: 0,
                  )
                ],
              ),
              child: BottomNavigationBar(
                currentIndex: ref.watch(counterProvider),
                onTap: onTap,
                items: [
                  BottomNavigationBarItem(
                    icon: Padding(
                      padding: EdgeInsets.only(top: 0.5.h),
                      child: const Icon(
                        Icons.menu_book_rounded,
                      ),
                    ),
                    label: 'Bookings',
                  ),
                  BottomNavigationBarItem(
                    icon: Padding(
                      padding: EdgeInsets.only(top: 0.5.h),
                      child: const Icon(
                        Icons.groups,
                      ),
                    ),
                    label: 'Teams',
                  ),
                  BottomNavigationBarItem(
                    icon: Padding(
                      padding: EdgeInsets.only(top: 0.5.h),
                      child: const Icon(
                        Icons.sports_cricket,
                      ),
                    ),
                    label: 'Highlights',
                  ),
                  BottomNavigationBarItem(
                    icon: Padding(
                      padding: EdgeInsets.only(top: 0.5.h),
                      child: const Icon(
                        Icons.bar_chart_rounded,
                      ),
                    ),
                    label: 'Stats',
                  ),
                ],
                iconSize: 3.h,
                selectedItemColor: const Color(0xFF238F20),
                unselectedItemColor: const Color(0xFF727272),
                showSelectedLabels: true,
                showUnselectedLabels: true,
                selectedLabelStyle: TextStyle(
                  color: const Color(0xFF238F20),
                  fontSize: 10.sp,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                  height: 2,
                  letterSpacing: 0.24,
                ),
                unselectedLabelStyle: TextStyle(
                  color: const Color(0xFF727272),
                  fontSize: 10.sp,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                  height: 2,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
