import 'package:flutter/material.dart';
import 'package:practice01/pages/homepage.dart';
import 'package:practice01/pages/login.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});


  @override
  Widget build(BuildContext context) {
    // var height = MediaQuery.of(context).size.height;
    // var width = MediaQuery.of(context).size.width;

    return Container(
      decoration: BoxDecoration(
          gradient:
              LinearGradient(colors: [Colors.white, Colors.amber.shade50])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // text welcome
              const Text(
                'Welcome',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),

              const SizedBox(
                height: 20,
              ),

              // subText welcome
              const Text.rich(TextSpan(children: [
                TextSpan(text: 'To our new concept application test coding\n'),
                TextSpan(text: 'for practice the '),
                TextSpan(text: 'flutter', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue))
              ])),

              const SizedBox(
                height: 50,
              ),

              // curve button
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => Login(),
                  ));
                },
                child: Container(
                  width: 180,
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.blue[100]),
                  child: const Center(
                    child: Padding(
                      padding: EdgeInsets.all(2.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'Enter the application',
                            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.white,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
