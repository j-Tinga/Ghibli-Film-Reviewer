import 'package:cis2203_final_exam/pages/ListedFilmPage.dart';
import 'package:flutter/material.dart';

class WatchListCard extends StatelessWidget {
  final String imageUrl;
  final int filmIndex;
  final Map film;

  WatchListCard({
    required this.imageUrl,
    required this.filmIndex,
    required this.film,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
        child: InkWell(
      splashColor: Colors.blue.withAlpha(30),
      onTap: () {
        navsToListedFilm(context);
      },
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(imageUrl),
            fit: BoxFit.fitWidth,
            alignment: Alignment.topCenter,
          ),
        ),
        child: Align(
            alignment: Alignment.bottomLeft,
            child: Text(
              "${film["title"]}",
              style: TextStyle(
                  backgroundColor: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 16),
            )),
      ),
    ));
  }

  void navsToListedFilm(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => ListedFilmPage(
          film: film,
          filmIndex: filmIndex,
          filmPoster: imageUrl,
        ),
      ),
    );
  }
}
