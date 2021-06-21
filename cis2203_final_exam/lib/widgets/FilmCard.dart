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
      child: SizedBox(
        width: 300,
        height: 100,
        child: Text(
          filmTitle,
        ),
      ),
    ));
  }
}
