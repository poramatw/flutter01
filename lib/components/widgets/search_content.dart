import 'dart:math' as math;

import 'package:flutter/material.dart';

class SearchContent extends StatefulWidget {
  const SearchContent({super.key});

  @override
  State<SearchContent> createState() => _SearchContentState();
}

class _SearchContentState extends State<SearchContent> {
  // create variable
  late String text = '';

  // create controller
  final TextEditingController _controller = TextEditingController();

  // create function
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 20, 30, 10),
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.search),
                    onPressed: () {
                      setState(() {
                        text = _controller.text;
                        _controller.clear();
                      });
                    },
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20))),
            ),
          ),
          Text(text),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 1,
                  crossAxisCount: 3,
                  mainAxisSpacing: 4,
                  crossAxisSpacing: 4),
              itemCount: 25,
              itemBuilder: (context, index) {
                math.Random random = math.Random();
                return Container(
                  // height: 250,
                  color: Color.fromRGBO(random.nextInt(255),
                      random.nextInt(255), random.nextInt(255), 1),
                  child: Image.network('https://api.slingacademy.com/public/sample-photos/${index + random.nextInt(50)}.jpeg', fit: BoxFit.cover,)
            
                );
              },
            ),
          )
        ],
      ),
    ));
  }
}
