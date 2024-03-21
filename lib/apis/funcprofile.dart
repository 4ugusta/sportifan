import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:sportifan_user/models/profile.dart';

class ProfileService {
 static const String baseUrl = 'some random shit';
  //all the methods related to the profile updating and delete or all the crud operation are in this.
  static Future<String>addProfile({required Profile profile}) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/addProfile'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(profile.toJson()),
      );

      if (response.statusCode == 200) {
        return 'Profile added successfully';
      } else {
        throw Exception('Failed to add profile');
      }
    } catch (e) {
      throw Exception('Error adding profile: $e');
    }
  }
  static Future<List<Profile>> getAllProfile({required Profile profile})async{
  try{
  final response= await http.get(Uri.parse("$baseUrl/getAllProfiles"));
   if (response.statusCode == 200) {
        Iterable profileList = json.decode(response.body);
        return profileList.map((profile) => Profile.fromJson(profile)).toList();
      } else {
        throw Exception('Failed to load profiles');
      }
  }
  catch(e){
    throw Exception('Error getting profiles: $e');
  }
  }
  static Future<Profile> getProfile(String id)async{
    try{
      final response = await http.get(Uri.parse('$baseUrl/profile/$id'));
       if (response.statusCode == 200) {
        return Profile.fromJson(json.decode(response.body));
      } else {
        throw Exception('Failed to load profile');
      }
    }
    catch(e){
        throw Exception('Error getting profile: $e');
    }
  }
  static Future<String> updateProfile(String id, Profile newData) async {
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
   static Future<String> deleteProfile(String id) async {
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
