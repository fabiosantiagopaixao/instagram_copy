import 'package:instagram_copy/models/image.dart';
import 'package:instagram_copy/models/post.dart';

List<Post> postsTest = [
  new Post(
      id: 1,
      username: 'my.user',
      imageUser: 'assets/my_profile.png',
      images: [
        Image(
            x: 600,
            y: 400,
            url:
                'https://cdn.pixabay.com/photo/2014/12/15/17/16/boardwalk-569314_960_720.jpg')
      ],
      datePosted: '15/05/2021 18:00',
      location: 'Vitória - Brasil'),
  new Post(
      id: 2,
      username: 'my.user',
      imageUser: 'assets/my_profile.png',
      images: [
        Image(
            url:
                'https://cdn.pixabay.com/photo/2020/03/03/20/31/boat-4899802_960_720.jpg'),
        Image(
            url:
                'https://cdn.pixabay.com/photo/2017/09/06/18/22/island-2722471_960_720.jpg'),
        Image(
            url:
                'https://cdn.pixabay.com/photo/2014/04/02/00/53/bird-of-paradise-flower-302889_960_720.jpg'),
        Image(
            url:
                'https://cdn.pixabay.com/photo/2018/01/03/18/06/beach-3058917_960_720.jpg'),
        Image(
            url:
                'https://cdn.pixabay.com/photo/2016/03/16/15/18/beauty-1260975_960_720.jpg')
      ],
      datePosted: '15/05/2021 18:00',
      description: 'Linda praia',
      location: 'Potosi - Bolivia'),
  new Post(
      id: 3,
      username: 'my.user',
      imageUser: 'assets/my_profile.png',
      images: [
        Image(
            url:
                'https://cdn.pixabay.com/photo/2018/03/20/23/54/horse-3245149_960_720.jpg')
      ],
      datePosted: '15/05/2021 18:00',
      description: 'Bonito cavalo',
      location: 'Trinidad - Beni'),
  new Post(
      id: 4,
      username: 'friend1',
      imageUser: 'assets/profile1.jpg',
      images: [
        Image(
            url:
                'https://cdn.pixabay.com/photo/2015/11/16/14/43/cat-1045782_960_720.jpg'),
        Image(
            url:
                'https://cdn.pixabay.com/photo/2021/06/29/15/56/kingfisher-6374507_960_720.jpg'),
        Image(
            url:
                'https://cdn.pixabay.com/photo/2016/09/07/22/38/cat-1652822_960_720.jpg'),
        Image(
            url:
                'https://cdn.pixabay.com/photo/2015/01/04/10/46/lion-588144_960_720.jpg'),
        Image(
            url:
                'https://cdn.pixabay.com/photo/2018/05/28/23/05/animal-3437467_960_720.jpg'),
        Image(
            url:
                'https://cdn.pixabay.com/photo/2016/02/19/10/05/cat-1209067_960_720.jpg'),
        Image(
            url:
                'https://cdn.pixabay.com/photo/2019/06/04/22/40/snowy-owl-4252522_960_720.jpg'),
        Image(
            url:
                'https://cdn.pixabay.com/photo/2015/11/16/14/43/cat-1045782_960_720.jpg'),
        Image(
            url:
                'https://cdn.pixabay.com/photo/2021/06/29/15/56/kingfisher-6374507_960_720.jpg'),
        Image(
            url:
                'https://cdn.pixabay.com/photo/2016/09/07/22/38/cat-1652822_960_720.jpg')
      ],
      datePosted: '14/07/2021 11:00'),
  new Post(
      id: 5,
      username: 'friend1',
      imageUser: 'assets/profile1.jpg',
      images: [
        Image(
            url:
                'https://cdn.pixabay.com/photo/2020/10/07/18/40/dog-5635960_960_720.jpg')
      ],
      datePosted: '14/07/2021 11:10'),
  new Post(
      id: 6,
      username: 'friend2',
      imageUser: 'assets/profile2.jpg',
      images: [
        Image(
            url:
                'https://cdn.pixabay.com/photo/2021/07/09/04/19/girl-6398258_960_720.jpg')
      ],
      datePosted: '14/07/2021 11:15'),
  new Post(
      id: 7,
      username: 'friend2',
      imageUser: 'assets/profile2.jpg',
      images: [
        Image(
            url:
                'https://cdn.pixabay.com/photo/2019/11/04/23/56/oso-pirata-4602417_960_720.png')
      ],
      datePosted: '14/07/2021 11:15')
];
