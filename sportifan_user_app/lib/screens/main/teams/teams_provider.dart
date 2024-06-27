import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sportifan_user/apis/functeam.dart';
import 'package:sportifan_user/models/team.dart';

final teamsDataProvider=FutureProvider<List<Team>>((ref){
 return ref.watch(teamServiceProvider).getAllTeams();
});