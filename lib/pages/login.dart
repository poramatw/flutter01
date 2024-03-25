import 'package:flutter/material.dart';
import 'package:practice01/components/components/textform_login.dart';
import 'package:practice01/pages/homepage.dart';

class Login extends StatefulWidget {
  Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool isLooked = true;

  TextEditingController _idController = TextEditingController();

  TextEditingController _pwController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.lock_open_outlined,
            size: 75,
            color: Colors.grey,
          ),
          const SizedBox(height: 20),
          TextFormLogin(
            hintTxt: 'id',
            controller: _idController,
            secure: false,
          ),
          const SizedBox(
            height: 20,
          ),
          TextFormLogin(
            hintTxt: 'password',
            controller: _pwController,
            secure: isLooked,
            icon: GestureDetector(
                onTap: () {
                  setState(() {
                    isLooked = !isLooked;
                  });
                },
                child: isLooked
                    ? const Icon(Icons.remove_red_eye_outlined)
                    : const Icon(Icons.remove_red_eye)),
          ),
          const SizedBox(
            height: 40,
          ),
          ElevatedButton(
              onPressed: () {
                print('id: ${_idController.text}, pw: ${_pwController.text}');

                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => Homepage(),
                ));

                // clear textField
                _idController.clear();
                _pwController.clear();
              },
              child: const Text('Login'))
        ],
      ),
    );
  }
}
