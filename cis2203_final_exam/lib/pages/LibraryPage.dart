import 'dart:convert';
import 'package:cis2203_final_exam/widgets/FilmCard.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart';

class LibraryPage extends StatefulWidget {
  const LibraryPage({Key? key}) : super(key: key);

  @override
  _LibraryPageState createState() => _LibraryPageState();
}

class _LibraryPageState extends State<LibraryPage> {
  final url = "https://ghibliapi.herokuapp.com/films";
  var _filmData = [];

  //Ghibli API doesn't include pictures, so I have to take some urls from the internet
  var _filmImages = [
    "https://en.wikipedia.org/wiki/Castle_in_the_Sky#/media/File:Castle_in_the_Sky_(1986).png",
  ];

  //http get Ghilbli Films
  void fetchFilms() async {
    try {
      final response = await get(Uri.parse(url));
      final jsonData = jsonDecode(response.body) as List;

      setState(() {
        _filmData = jsonData;
      });
    } catch (e) {
      print("HTTP request failed");
    }
  }

  @override
  Widget build(BuildContext context) {
    fetchFilms();
    return Scaffold(
        appBar: AppBar(
          title: Text("Ghibli Film Library"),
        ),
        body: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
            childAspectRatio: MediaQuery.of(context).size.width /
                (MediaQuery.of(context).size.height / 1),
          ),
          itemCount: _filmData.length,
          itemBuilder: (context, i) {
            final film = _filmData[i];
            return FilmCard(
                filmTitle: "${film["title"]}",
                imageUrl:
                    "https://m.media-amazon.com/images/M/MV5BZmY2NjUzNDQtNTgxNC00M2Q4LTljOWQtMjNjNDBjNWUxNmJlXkEyXkFqcGdeQXVyNTA4NzY1MzY@._V1_UY1200_CR85,0,630,1200_AL_.jpg");
          },
        ));
  }
}
