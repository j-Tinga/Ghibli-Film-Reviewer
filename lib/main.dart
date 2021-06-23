import 'package:cis2203_final_exam/pages/login.dart';
import 'package:cis2203_final_exam/routes.dart';
import 'package:flutter/material.dart';

//note to self: if hinay ang loading sa Firebase/, implement future builders
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ghilbli Film Reviewer',
      theme: ThemeData(
        brightness: Brightness.dark,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Login(),
      routes: routes,
    );
  }
}
