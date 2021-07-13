import 'dart:convert';

class Story {
  String name;
  String profileImage;

  Story({
    required this.name,
    required this.profileImage,
  });

  factory Story.fromJson(Map<String, dynamic> parsedJson) {
    return Story(
      name: parsedJson['name'],
      profileImage: parsedJson['profileImage'],
    );
  }

  static List<Story> listFromJson(List<dynamic> list) {
    List<Story> rows = list.map((i) => Story.fromJson(i)).toList();
    return rows;
  }

  static List<Story> listFromString(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Story>((json) => Story.fromJson(json)).toList();
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'profileImage': profileImage,
      };
}
