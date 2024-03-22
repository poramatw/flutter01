import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../../models/home_models.dart';

class MainContent extends StatefulWidget {
  const MainContent({super.key});

  @override
  State<MainContent> createState() => _MainContentState();
}

class _MainContentState extends State<MainContent> {
  // create list variables
  List<HomeModel> getModel = [];

   // create function
  void fetchData() {
    getModel = HomeModel.addModel();
  }

  math.Random random = math.Random();

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.blue[100],
      child: ListView.separated(
        scrollDirection: Axis.vertical,
        separatorBuilder: (context, index) => const SizedBox(
          height: 10,
        ),
        itemCount: getModel.length,
        itemBuilder: (context, index) {
          return Container(
            color: Colors.grey[200],
            height: 500,
            child: Column(
              children: [
                Expanded(
                    flex: 3,
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Image.network(
                        'https://api.slingacademy.com/public/sample-photos/${index + random.nextInt(50)}.jpeg',
                        fit: BoxFit.fill,
                      ),
                    )),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          IconButton(
                              onPressed: () {
                                setState(() {
                                  getModel[index].isFav =
                                      !getModel[index].isFav;
                                });
                              },
                              icon: getModel[index].isFav
                                  ? const Icon(Icons.favorite_border_outlined)
                                  : const Icon(
                                      Icons.favorite,
                                      color: Colors.red,
                                    )),
                          IconButton(
                              onPressed: () {
                                showModalBottomSheet(
                                  context: context,
                                  builder: (context) {
                                    return Container(
                                      color: Colors.grey,
                                    );
                                  },
                                );
                              },
                              icon: const Icon(Icons.comment)),
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.share_outlined)),
                          const Spacer(),
                          IconButton(
                              onPressed: () {
                                setState(() {
                                  getModel[index].isBook =
                                      !getModel[index].isBook;
                                });
                              },
                              icon: getModel[index].isBook
                                  ? const Icon(Icons.bookmark_border_outlined)
                                  : Icon(
                                      Icons.bookmark,
                                      color: Colors.yellow[600],
                                    ))
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(getModel[index].header),
                            Text(getModel[index].detail),
                            Text(getModel[index].comment)
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
