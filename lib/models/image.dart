import 'dart:convert';

class Image {
  String url;
  double? x;
  double? y;

  Image({
    required this.url,
    this.x,
    this.y,
  });

  factory Image.fromJson(Map<String, dynamic> parsedJson) {
    return Image(
      url: parsedJson['url'],
      x: parsedJson['x'],
      y: parsedJson['y'],
    );
  }

  static List<Image> listFromJson(List<dynamic> list) {
    List<Image> rows = list.map((i) => Image.fromJson(i)).toList();
    return rows;
  }

  static List<Image> listFromString(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Image>((json) => Image.fromJson(json)).toList();
  }

  Map<String, dynamic> toJson() => {
        'url': url,
        'x': x,
        'y': y,
      };
}
