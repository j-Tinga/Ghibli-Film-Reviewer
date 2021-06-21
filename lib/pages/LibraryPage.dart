import 'dart:convert';
import 'package:cis2203_final_exam/widgets/FilmCard.dart';
import 'package:cis2203_final_exam/classes/filmImages.dart';
import 'package:cis2203_final_exam/widgets/FormattedButton.dart';
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
  var _filmPosters = new filmImage();

  //http get Ghilbli Films
  void fetchFilms() async {
    try {
      final response = await get(Uri.parse(url));
      final jsonData = jsonDecode(response.body) as List;

      setState(() {
        _filmData = jsonData;
      });
    } catch (e) {
      print("HTTP closed");
    }
  }

  @override
  Widget build(BuildContext context) {
    fetchFilms();
    return Scaffold(
        appBar: AppBar(
          title: Text("Ghibli Film Library"),
        ),
        body: _filmData.isEmpty
            ? Container(
                alignment: Alignment.center,
                child: CircularProgressIndicator(),
              )
            : GridView.builder(
                scrollDirection: Axis.vertical,
                physics: ScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  childAspectRatio: MediaQuery.of(context).size.width /
                      (MediaQuery.of(context).size.height / 1.5),
                ),
                itemCount: _filmData.length,
                itemBuilder: (context, i) {
                  final film = _filmData[i];
                  final filmImage = _filmPosters.getFilmImages[i];
                  return FilmCard(
                      film: film, filmIndex: i, imageUrl: filmImage);
                },
              ));
  }
}
