import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:sportifan_user/models/profile.dart';

class ProfileService {
  static const String baseUrl = 'http://192.168.73.143:8080/api';
  //all the methods related to the profile updating and delete or all the crud operation are in this.
  Future<String> addProfile({required Profile profile}) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/addProfile'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({
          "bio": profile.bio,
          "username": profile.username,
          "emailId": profile.emailId,
          "phoneNumber": profile.phoneNumber,
          "userId": profile.userId,
          "status": profile.status
        }),
      );

      if (response.statusCode == 200) {
        print(response.toString());
        return 'Profile added successfully';
      } else {
        throw Exception('Failed to add profile');
      }
    } catch (e) {
      throw Exception('Error adding profile: $e');
    }
  }

  Future<List<Profile>> getAllProfile({required Profile profile}) async {
    try {
      final response = await http.get(Uri.parse("$baseUrl/getAllProfiles"));
      if (response.statusCode == 200) {
        Iterable profileList = json.decode(response.body);
        return profileList.map((profile) => Profile.fromJson(profile)).toList();
      } else {
        throw Exception('Failed to load profiles');
      }
    } catch (e) {
      throw Exception('Error getting profiles: $e');
    }
  }

  Future<Profile> getProfile(String id) async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/profile/$id'));
      if (response.statusCode == 200) {
        return Profile.fromJson(json.decode(response.body));
      } else {
        throw Exception('Failed to load profile');
      }
    } catch (e) {
      throw Exception('Error getting profile: $e');
    }
  }

  Future<String> updateProfile(String id, Profile newData) async {
    try {
      final response = await http.put(
        Uri.parse('$baseUrl/profile/$id'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(newData.toJson()),
      );

      if (response.statusCode == 200) {
        return 'Profile updated successfully';
      } else {
        throw Exception('Failed to update profile');
      }
    } catch (e) {
      throw Exception('Error updating profile: $e');
    }
  }

  Future<String> deleteProfile(String id) async {
    try {
      final response = await http.delete(Uri.parse('$baseUrl/profile/$id'));

      if (response.statusCode == 200) {
        return 'Profile deleted successfully';
      } else {
        throw Exception('Failed to delete profile');
      }
    } catch (e) {
      throw Exception('Error deleting profile: $e');
    }
  }
}

final profileProvider = Provider<ProfileService>((ref) =>
    ProfileService()); //this provider is the entry point of shared data.
//more like injecting the class in the ref to use as a global state of the shared data.
