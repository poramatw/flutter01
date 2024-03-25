import 'package:flutter/material.dart';

class RightDrawer extends StatelessWidget {
  const RightDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Drawer(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 50),
            child: Icon(Icons.lock_open_outlined),
          )
        ],
      ),
    );
  }
}