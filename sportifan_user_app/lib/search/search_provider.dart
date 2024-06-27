import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchQueryNotifier extends StateNotifier<String> {
  SearchQueryNotifier() : super('');

  void update(String value) {
    state = value;
  }
}

final searchQueryProvider = StateNotifierProvider<SearchQueryNotifier, String>(
    (ref) => SearchQueryNotifier());
