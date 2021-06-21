import 'package:flutter/material.dart';

class FilmCard extends StatelessWidget {
  final String filmTitle;
  final String imageUrl;

  FilmCard({
    required this.filmTitle,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
        child: InkWell(
      splashColor: Colors.blue.withAlpha(30),
      onTap: () {
        print('Card tapped.');
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
              filmTitle,
              style: TextStyle(
                  backgroundColor: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            )),
      ),
    ));
  }
}
