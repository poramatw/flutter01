import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:practice01/api/image_fetch.dart';

import '../../models/home_models.dart';

class MainContent extends StatefulWidget {
  const MainContent({super.key});

  @override
  State<MainContent> createState() => _MainContentState();
}

class _MainContentState extends State<MainContent> {
  // create list variables
  List<HomeModel> getModel = [];
  math.Random random = math.Random();
  Future<List<dynamic>>? images;

  @override
  void initState() {
    super.initState();
    images = fetchDataAPI();
    fetchData();
  }

  // create function
  void fetchData() {
    getModel = HomeModel.addModel();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<dynamic>>(
      future: images,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final imageData = snapshot.data!;
          return ListView.separated(
            separatorBuilder: (context, index) => const SizedBox(
              height: 10,
            ),
            itemCount: imageData.length,
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
                            imageData[index]['url'].toString(),
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
                                      ? const Icon(
                                          Icons.favorite_border_outlined)
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
                                      ? const Icon(
                                          Icons.bookmark_border_outlined)
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
                                Text(
                                  imageData[index]['title'].toString(),
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                                Text(
                                  imageData[index]['description'].toString(),
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Text(imageData[index]['id'].toString())
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
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  // FutureBuilder<List<FetchImage>> FutureBuild() {
  //   return FutureBuilder(
  //   future: images,
  //   builder: (context, snapshot) {
  //     if (snapshot.hasData) {
  //       final images = snapshot.data!;

  //       return ListView.builder(
  //         scrollDirection: Axis.vertical,
  //         itemCount: images.length,
  //         itemBuilder: (context, index) {
  //           final image = images[index];
  //           return Container(
  //             color: Colors.grey[200],
  //             height: 500,
  //             child: Column(
  //               children: [
  //                 Expanded(
  //                     flex: 3,
  //                     child: Padding(
  //                       padding: const EdgeInsets.all(2.0),
  //                       child: Image.network(
  //                         image.photos as String,
  //                         fit: BoxFit.fill,
  //                       ),
  //                     )),
  //                 Expanded(
  //                   child: Column(
  //                     crossAxisAlignment: CrossAxisAlignment.start,
  //                     children: [
  //                       Row(
  //                         children: [
  //                           IconButton(
  //                               onPressed: () {
  //                                 setState(() {
  //                                   getModel[index].isFav =
  //                                       !getModel[index].isFav;
  //                                 });
  //                               },
  //                               icon: getModel[index].isFav
  //                                   ? const Icon(
  //                                       Icons.favorite_border_outlined)
  //                                   : const Icon(
  //                                       Icons.favorite,
  //                                       color: Colors.red,
  //                                     )),
  //                           IconButton(
  //                               onPressed: () {
  //                                 showModalBottomSheet(
  //                                   context: context,
  //                                   builder: (context) {
  //                                     return Container(
  //                                       color: Colors.grey,
  //                                     );
  //                                   },
  //                                 );
  //                               },
  //                               icon: const Icon(Icons.comment)),
  //                           IconButton(
  //                               onPressed: () {},
  //                               icon: const Icon(Icons.share_outlined)),
  //                           const Spacer(),
  //                           IconButton(
  //                               onPressed: () {
  //                                 setState(() {
  //                                   getModel[index].isBook =
  //                                       !getModel[index].isBook;
  //                                 });
  //                               },
  //                               icon: getModel[index].isBook
  //                                   ? const Icon(
  //                                       Icons.bookmark_border_outlined)
  //                                   : Icon(
  //                                       Icons.bookmark,
  //                                       color: Colors.yellow[600],
  //                                     ))
  //                         ],
  //                       ),
  //                       Padding(
  //                         padding: const EdgeInsets.only(left: 10),
  //                         child: Column(
  //                           crossAxisAlignment: CrossAxisAlignment.start,
  //                           children: [
  //                             Text(getModel[index].header),
  //                             Text(getModel[index].detail),
  //                             Text(getModel[index].comment)
  //                           ],
  //                         ),
  //                       )
  //                     ],
  //                   ),
  //                 )
  //               ],
  //             ),
  //           );
  //           ;
  //         },
  //       );
  //     } else if (snapshot.hasError) {
  //       print(snapshot.error);
  //       return Text('${snapshot.error}');
  //     } else {
  //       return const Center(child: CircularProgressIndicator());
  //     }
  //   },
  // );
  // }

  Container MockUp() {
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
