import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sportifan_user/models/venue.dart';
import 'package:sportifan_user/screens/main/booking/venue_provider.dart';
import 'package:sportifan_user/search/search_provider.dart';

final venuesFutureProvider =
    FutureProvider.autoDispose<List<Venue>>((ref) async {
  final query = ref.watch(searchQueryProvider);
  return await ref.watch(venueDataProvider(query).future);
});
