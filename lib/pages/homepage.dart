// ignore_for_file: sized_box_for_whitespace, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:practice01/components/components/right_drawer.dart';

import '../components/widgets/main_content.dart';
import '../components/widgets/notice.dart';
import '../components/widgets/profile.dart';
import '../components/widgets/search_content.dart';

class Homepage extends StatefulWidget {
  Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  // create variables
  late int contentIndex = 0;

  List bodyList = [
    const MainContent(),
    const SearchContent(),
    Notice(),
    Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: contentIndex == 0
          ? AppBar(
              elevation: 1,
              backgroundColor: Colors.grey[200],
              automaticallyImplyLeading: false,
              title: const Row(
                children: [
                  Icon(Icons.camera_alt_outlined),
                  Text('Flutter Pac'),
                ],
              ),
              actions: [
                IconButton(
                  icon: const Icon(Icons.favorite_border_outlined),
                  onPressed: () {},
                ),
                IconButton(
                    onPressed: () {}, icon: const Icon(Icons.message_outlined))
              ],
            )
          : null,
      body: Column(
        children: [
          contentIndex == 0
              ? Container(
                  height: 80,
                  color: Colors.transparent,
                  child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: const EdgeInsets.symmetric(vertical: 2),
                          height: 75,
                          width: 75,
                          decoration: BoxDecoration(
                              color: Colors.blue[50],
                              borderRadius: BorderRadius.circular(50),
                              border: Border.all(color: Colors.black)),
                          child: const Center(
                            child: Icon(Icons.person),
                          ),
                        );
                      },
                      separatorBuilder: (context, index) => const SizedBox(
                            width: 5,
                          ),
                      itemCount: 10),
                )
              : Container(),
          Expanded(
            flex: 11,
            child: bodyList[contentIndex],
          ),
          Expanded(
              child: Container(
            color: Colors.grey[800],
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  onPressed: () {
                    setState(() {
                      contentIndex = 0;
                    });
                  },
                  icon: const Icon(Icons.home),
                  color: Colors.white,
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      contentIndex = 1;
                    });
                  },
                  icon: const Icon(Icons.search),
                  color: Colors.white,
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.add_box_outlined),
                  color: Colors.white,
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      contentIndex = 2;
                    });
                  },
                  icon: const Icon(Icons.ondemand_video_outlined),
                  color: Colors.white,
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      contentIndex = 3;
                    });
                  },
                  icon: const Icon(Icons.person_pin),
                  color: Colors.white,
                ),
              ],
            ),
          ))
        ],
      ),
    );
  }
}
