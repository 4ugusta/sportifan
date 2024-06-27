import 'package:flutter/material.dart';

import 'package:sportifan_user/screens/main/booking/venue_provider.dart';
import 'package:sportifan_user/screens/states/choose_location.dart';
import 'package:sportifan_user/screens/states/select_date.dart';
import 'package:sportifan_user/search/future_provider.dart';
import 'package:sportifan_user/widgets/venue_card.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BookingView extends ConsumerStatefulWidget {
  const BookingView({super.key});

  @override
  ConsumerState<BookingView> createState() => _BookingViewState();
}

String selectedDate = '12 MON';
String selectedTime = '6am-7am';

class _BookingViewState extends ConsumerState<BookingView> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController _searchController = TextEditingController();
    final _data = ref.watch(venueDataProvider(_searchController.text));
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(2.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Book a Venue',
                        style: TextStyle(
                          color: const Color(0xFF262626),
                          fontSize: 18.sp,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                          height: 0,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(0.5.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {
                                showModalBottomSheet(
                                  context: context,
                                  builder: (context) {
                                    return ChooseLocation(
                                      controller: TextEditingController(),
                                    );
                                  },
                                );
                              },
                              child: Text(
                                'Kolkata',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: const Color(0xFF238F20),
                                  fontSize: 10.sp,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w600,
                                  height: 0,
                                ),
                              ),
                            ),
                            SizedBox(width: (4 / 3.6).w),
                            GestureDetector(
                              onTap: () {
                                showModalBottomSheet(
                                  context: context,
                                  builder: (context) {
                                    return ChooseLocation(
                                      controller: TextEditingController(),
                                    );
                                  },
                                );
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 1.h, horizontal: (6 / 8).h),
                                child: Image.asset(
                                  'assets/Profile/Icon/arrow_down.png',
                                  width: (11.18 / 3.6).w,
                                  height: (6.59 / 8).h,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 2.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            builder: (context) {
                              return SelectDate(
                                callback: (date, time, context) {
                                  setState(() {
                                    selectedDate = date;
                                    selectedTime = time;
                                  });
                                },
                              );
                            },
                          );
                        },
                        child: Text(
                          '$selectedDate, $selectedTime',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: const Color(0xFF238F20),
                            fontSize: 10.sp,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                            height: 0,
                          ),
                        ),
                      ),
                      SizedBox(width: (4 / 3.6).w),
                      GestureDetector(
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            builder: (context) {
                              return SelectDate(
                                callback: (date, time, context) {
                                  setState(() {
                                    selectedDate = date;
                                    selectedTime = time;
                                  });
                                },
                              );
                            },
                          );
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 1.h, horizontal: (6 / 8).h),
                          child: Image.asset(
                            'assets/Profile/Icon/arrow_down.png',
                            width: (11.18 / 3.6).w,
                            height: (6.59 / 8).h,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: 2.h, right: 2.h, top: 1.h),
                child: ref.watch(venuesFutureProvider).when(
                      data: (venues) {
                        return SingleChildScrollView(
                          child: Column(
                            children: venues.map((venue) {
                              print(
                                  venue); // This will print the venue object in the console
                              return VenueCard(
                                venue: venue,
                                venueName: venue.venueName ?? "",
                                pricing: venue.venueCharge?.toString() ?? "0",
                                location:
                                    venue.venueLocation ?? "", // Corrected here
                                rating: venue.venueRating?.toString() ??
                                    "", // Corrected here
                                distance: venue.status ?? "",
                              );
                            }).toList(),
                          ),
                        );
                      },
                      error: (err, s) => Text(err.toString()),
                      loading: () => const Center(
                        child:
                            CircularProgressIndicator(color: Color(0xFF238F20)),
                      ),
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
