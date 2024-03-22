import 'dart:math' as math;

import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  late final int _posts = 25;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Account'),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(Icons.alternate_email_outlined)),
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.add_box_outlined)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.menu_outlined)),
        ],
      ),
      body: Column(
        children: [
          // head profiles
          const SizedBox(
            height: 20,
          ),
          Container(
            height: 200,
            // color: Colors.grey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Container(
                            color: Colors.blue[100],
                            child: const FlutterLogo(
                              size: 90,
                            ),
                          )),
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(right: 15.0),
                      child: Column(
                        // mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(_posts.toString()),
                          const Text('Posts')
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(right: 15.0),
                      child: Column(
                        // mainAxisAlignment: MainAxisAlignment.center,
                        children: [Text('1'), Text('Followers')],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(right: 15.0),
                      child: Column(
                        // mainAxisAlignment: MainAxisAlignment.center,
                        children: [Text('1'), Text('Followings')],
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.only(left: 20, top: 15),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Username',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text('Historic'),
                    ],
                  ),
                )
              ],
            ),
          ),

          // contents,
          Expanded(
              child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 1,
                crossAxisCount: 3,
                mainAxisSpacing: 4,
                crossAxisSpacing: 4),
            itemCount: _posts,
            itemBuilder: (context, index) {
              math.Random random = math.Random();
              return Container(
                  // height: 250,
                  color: Color.fromRGBO(random.nextInt(255),
                      random.nextInt(255), random.nextInt(255), 1),
                  child: Image.network(
                    'https://api.slingacademy.com/public/sample-photos/${index + random.nextInt(50)}.jpeg',
                    fit: BoxFit.cover,
                  ));
            },
          ))
        ],
      ),
    );
  }
}
