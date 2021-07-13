import 'dart:convert';

import 'package:instagram_copy/models/story.dart';

class Profile {
  String name;
  String username;
  String? website;
  String? bio;
  List<Story>? storys = [];

  Profile(
      {required this.name,
      required this.username,
      this.website,
      this.bio,
      this.storys});

  factory Profile.fromJson(Map<String, dynamic> parsedJson) {
    return Profile(
      name: parsedJson['name'],
      username: parsedJson['username'],
      website: parsedJson['website'],
      bio: parsedJson['bio'],
      storys: Story.listFromString(parsedJson['storys']),
    );
  }

  static List<Profile> listFromJson(List<dynamic> list) {
    List<Profile> rows = list.map((i) => Profile.fromJson(i)).toList();
    return rows;
  }

  static List<Profile> listFromString(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Profile>((json) => Profile.fromJson(json)).toList();
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'username': username,
        'website': website,
        'bio': bio,
      };
}
