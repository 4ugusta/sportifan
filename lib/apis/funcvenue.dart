import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:sportifan_user/models/venue.dart';

class VenueService {
 static const String baseUrl = 'some random shit';
  static Future<String> addVenue(Venue venueData) async {
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

  static Future<List<Venue>> getAllVenues() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/venues'));

      if (response.statusCode == 200) {
        Iterable venueList = json.decode(response.body);
        return venueList.map((venue) => Venue.fromJson(venue)).toList();
      } else {
        throw Exception('Failed to load venues');
      }
    } catch (e) {
      throw Exception('Error getting venues: $e');
    }
  }

  static Future<Venue> getVenue(String id) async {
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

  static Future<String> updateVenue(String id, Venue newData) async {
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

  static Future<String> deleteVenue(String id) async {
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
