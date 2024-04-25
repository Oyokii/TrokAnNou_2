import 'package:flutter/material.dart';
import 'package:trokannou/pages/home.dart';
import 'package:trokannou/pages/serviceDetails.dart';
import 'package:trokannou/pages/signup.dart';

import 'pages/ajoutService.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFDDA15E),
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFFDDA15E)),
        useMaterial3: true,
      ),
      home: HomePage(),
      debugShowCheckedModeBanner: false,
      routes: {
        '/signup.dart': (context) => SignupPage(),
      },
    );
  }
}
