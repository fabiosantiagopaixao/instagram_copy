import 'dart:convert';

class Post {
  String username;
  String imageUser;
  String mediUrl;
  String? location;
  String? description;
  int? likes;
  String datePoted;


  Post({
    required this.username,
    required this.imageUser,
    required this.mediUrl,
    this.location,
    this.description,
    this.likes,
    required this.datePoted,
  });


  factory Post.fromJson(Map<String,dynamic> parsedJson){
    return Post(
      username : parsedJson['username'],
      imageUser : parsedJson['imageUser'],
      mediUrl : parsedJson['mediUrl'],
      location : parsedJson['location'],
      description : parsedJson['description'],
      likes : parsedJson['likes'],
      datePoted : parsedJson['description'],
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

  static List<Post> getPostsTest() {
    List<Post> posts = [];
    Post post = new Post(
        username: "my.user",
        imageUser: "assets/my_profile.png",
        mediUrl: "https://cdn.pixabay.com/photo/2014/12/15/17/16/boardwalk-569314_960_720.jpg",
        datePoted: "15/05/2021 18:00");
    post.location = "Vitória - Brasil";
    posts.add(post);
    // ---
    post = new Post(
        username: "my.user",
        imageUser: "assets/my_profile.png",
        mediUrl: "https://cdn.pixabay.com/photo/2016/11/08/05/08/adult-1807500_960_720.jpg",
        datePoted: "15/05/2021 18:00")
    ;
    post.description = "Linda praia";
    post.location = "Potosi - Bolivia";
    posts.add(post);
    // ---
    post = new Post(
        username: "my.user",
        imageUser: "assets/my_profile.png",
        mediUrl: "https://cdn.pixabay.com/photo/2018/03/20/23/54/horse-3245149_960_720.jpg",
        datePoted: "15/05/2021 18:00")
    ;
    post.description = "Bonito cavalo";
    post.location = "Trinidad - Beni";
    posts.add(post);
    return posts;
  }

  Map<String,dynamic> toJson()=>{
    'username' : username,
    'imageUser' : imageUser,
    'mediUrl' : mediUrl,
    'location' : location,
    'description' : description,
    'likes' : likes,
    'datePoted' : datePoted,
  };

}