import 'package:cis2203_final_exam/widgets/BottomNavbar.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'pages/MainPage.dart';

//note to self: if hinay ang loading sa Firebase/, implement future builders
Future<void> main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ghilbli Film Reviewer',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MainPage(),
    );
  }
}
