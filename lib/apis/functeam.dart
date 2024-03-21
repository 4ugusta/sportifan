import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:sportifan_user/models/team.dart';

class TeamService {
  static const String baseUrl = 'some random shit';
  static Future<String> addTeam(Team teamData) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/addTeam'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(teamData.toJson()),
      );

      if (response.statusCode == 200) {
        return 'Team added successfully';
      } else {
        throw Exception('Failed to add team');
      }
    } catch (e) {
      throw Exception('Error adding team: $e');
    }
  }

  static Future<List<Team>> getAllTeams() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/teams'));

      if (response.statusCode == 200) {
        Iterable teamList = json.decode(response.body);
        return teamList.map((team) => Team.fromJson(team)).toList();
      } else {
        throw Exception('Failed to load teams');
      }
    } catch (e) {
      throw Exception('Error getting teams: $e');
    }
  }

  static Future<Team> getTeam(String id) async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/team/$id'));

      if (response.statusCode == 200) {
        return Team.fromJson(json.decode(response.body));
      } else {
        throw Exception('Failed to load team');
      }
    } catch (e) {
      throw Exception('Error getting team: $e');
    }
  }

  static Future<String> updateTeam(String id, Team newData) async {
    try {
      final response = await http.put(
        Uri.parse('$baseUrl/team/$id'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(newData.toJson()),
      );

      if (response.statusCode == 200) {
        return 'Team updated successfully';
      } else {
        throw Exception('Failed to update team');
      }
    } catch (e) {
      throw Exception('Error updating team: $e');
    }
  }

  static Future<String> deleteTeam(String id) async {
    try {
      final response = await http.delete(Uri.parse('$baseUrl/team/$id'));

      if (response.statusCode == 200) {
        return 'Team deleted successfully';
      } else {
        throw Exception('Failed to delete team');
      }
    } catch (e) {
      throw Exception('Error deleting team: $e');
    }
  }
}
