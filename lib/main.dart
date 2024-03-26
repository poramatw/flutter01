import 'package:flutter/material.dart';
import 'package:practice01/pages/homepage.dart';
import 'package:practice01/pages/welcome.dart';
import 'package:practice01/provider/provider_service.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<CartProvider>(
      create: (context) => CartProvider(),
    ),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          brightness: Brightness.light),
      home: const Welcome(),
    );
  }
}
