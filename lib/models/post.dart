import 'dart:convert';

class Post {
  int id;
  String username;
  String imageUser;
  List<String> images;
  String? location;
  String? description;
  int? likes;
  String datePoted;

  Post({
    required this.id,
    required this.username,
    required this.imageUser,
    required this.images,
    this.location,
    this.description,
    this.likes,
    required this.datePoted,
  });

  factory Post.fromJson(Map<String, dynamic> parsedJson) {
    return Post(
      id: parsedJson['id'],
      username: parsedJson['username'],
      imageUser: parsedJson['imageUser'],
      images: parsedJson['mediUrl'],
      location: parsedJson['location'],
      description: parsedJson['description'],
      likes: parsedJson['likes'],
      datePoted: parsedJson['description'],
    );
  }

  static List<Post> listFromJson(List<dynamic> list) {
    List<Post> rows = list.map((i) => Post.fromJson(i)).toList();
    return rows;
  }

  static List<Post> listFromString(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Post>((json) => Post.fromJson(json)).toList();
  }

  Map<String, dynamic> toJson() => {
        'username': username,
        'imageUser': imageUser,
        'images': images,
        'location': location,
        'description': description,
        'likes': likes,
        'datePoted': datePoted,
      };
}
