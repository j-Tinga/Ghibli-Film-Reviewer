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
      child: Column(
        children: [
          Text(filmTitle),
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                    'https://static.wikia.nocookie.net/studio-ghibli/images/c/c1/Castle_in_the_Sky.jpg/revision/latest?cb=20210608122415.png'),
                fit: BoxFit.fitWidth,
                alignment: Alignment.topCenter,
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
