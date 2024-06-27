import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sportifan_user/apis/funcvenue.dart';
import 'package:sportifan_user/models/venue.dart';

final venueDataProvider =
    FutureProvider.family<List<Venue>, String>((ref, query) async {
  return ref.watch(venueServiceProvider).getAllVenues(search: query);
});
