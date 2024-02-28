// ignore_for_file: public_member_api_docs, sort_constructors_first


import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:amplify_storage_s3/amplify_storage_s3.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

import 'package:insta_clone/screens/contents_screen.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;
  // final List<String> src = [
  //   "assets/images/img1.jpg",
  //   "assets/images/img2.jpg",
  //   "assets/images/img3.jpg",
  //   "assets/images/img4.jpg",
  //   "assets/images/img5.jpg",
  // ];

  final List<String> src = ["assets/videos/vid1.mp4"];
   

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
List<String> _videoUrls = [];

  Future<void> fetchVideos() async {
    try {
      ListResult result = await Amplify.Storage.list();
      setState(() {
        _videoUrls = result.items.map((item) => item.key).toList();
      });
    } catch (e) {
      print('Failed to fetch videos: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        //   title: Text(widget.title),
        // ),
        body: SafeArea(
            child: Stack(
      children: [
        //ContentScreen(),
        Swiper(
            itemBuilder: (context, index) {
              //here we previously added local images
              return ContentScreen(src: widget.src[index]);
            },
            scrollDirection: Axis.vertical,
            itemCount: widget.src.length),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Explore",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "Following",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "Friends",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        )
      ],
    )));
  }
}
