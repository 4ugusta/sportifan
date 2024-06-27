import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:sportifan_user/models/venue.dart';

class VenueService {
  static const String baseUrl = 'http://192.168.73.143:8080/api';
  Future<String> addVenue(Venue venueData) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/addVenue'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(venueData.toJson()),
      );

      if (response.statusCode == 200) {
        return 'Venue added successfully';
      } else {
        throw Exception('Failed to add venue');
      }
    } catch (e) {
      throw Exception('Error adding venue: $e');
    }
  }

  Future<List<Venue>> getAllVenues({String? search}) async {
    try {
      final response = await http.get(Uri.parse(
          '$baseUrl/venues${search != null ? '?search=$search' : ''}'));
      print(response.body);

      if (response.statusCode == 200) {
        Iterable venueList = json.decode(response.body);
        print(venueList);
        return venueList.map((venue) => Venue.fromJson(venue)).toList();
      } else if (response.statusCode == 404) {
        return [];
      } else {
        throw Exception('Failed to load venues');
      }
    } catch (e) {
      throw Exception('Error getting venues: $e');
    }
  }

  Future<Venue> getVenue(String id) async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/venue/$id'));

      if (response.statusCode == 200) {
        return Venue.fromJson(json.decode(response.body));
      } else {
        throw Exception('Failed to load venue');
      }
    } catch (e) {
      throw Exception('Error getting venue: $e');
    }
  }

  Future<String> updateVenue(String id, Venue newData) async {
    try {
      final response = await http.put(
        Uri.parse('$baseUrl/venue/$id'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(newData.toJson()),
      );

      if (response.statusCode == 200) {
        return 'Venue updated successfully';
      } else {
        throw Exception('Failed to update venue');
      }
    } catch (e) {
      throw Exception('Error updating venue: $e');
    }
  }

  Future<String> deleteVenue(String id) async {
    try {
      final response = await http.delete(Uri.parse('$baseUrl/venue/$id'));

      if (response.statusCode == 200) {
        return 'Venue deleted successfully';
      } else {
        throw Exception('Failed to delete venue');
      }
    } catch (e) {
      throw Exception('Error deleting venue: $e');
    }
  }
}

final venueServiceProvider = Provider<VenueService>((ref) => VenueService());
//basically injecting the class venue in a provider to use it as a shared data in the ref.