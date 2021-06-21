import 'package:cis2203_final_exam/pages/MainPage.dart';
import 'package:flutter/material.dart';

class FilmPage extends StatelessWidget {
  final Map film;
  final String filmPoster;

  const FilmPage({Key? key, required this.film, required this.filmPoster})
      : super(key: key);
  static const String routeName = "FilmPage";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
      title: Text("Film Post"),
    ));
  }
}
