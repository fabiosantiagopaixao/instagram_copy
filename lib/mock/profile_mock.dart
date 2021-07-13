import 'package:instagram_copy/models/profile.dart';
import 'package:instagram_copy/models/story.dart';

var profileTest = new Profile(
    name: "My Full Name",
    username: "my.user",
    website: "fabiopaixao.me",
    bio: "Life is better when you're laughing.",
    storys: storysTest);

var storysTest = [
  Story(name: "Jaqueline Santiago", profileImage: "assets/profile1.jpg"),
  Story(name: "Maria Santiago", profileImage: "assets/profile2.jpg"),
  Story(name: "Carla Assunção", profileImage: "assets/profile3.jpg"),
  Story(name: "Adriano Souza", profileImage: "assets/profile4.jpg"),
  Story(name: "Sandy Oliveira", profileImage: "assets/profile5.jpg"),
  Story(name: "Jaqueline Santiago", profileImage: "assets/profile6.jpg"),
  Story(name: "Jessica Moraes", profileImage: "assets/profile7.jpg")
];
