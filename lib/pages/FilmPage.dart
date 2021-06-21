import 'package:cis2203_final_exam/database/ghibi_database.dart';
import 'package:cis2203_final_exam/models/watchList.dart';
import 'package:cis2203_final_exam/widgets/FormattedButton.dart';
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
          title: Text("${film["title"]}"),
        ),
        body: ListView(
          children: [
            Image.network(filmPoster,
                height: MediaQuery.of(context).size.height / 2.3),
            Container(
              padding: const EdgeInsets.all(24),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: Text(
                            "${film["title"]}",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 27,
                            ),
                          ),
                        ),
                        Text(
                          "${film["original_title"]} / ${film["original_title_romanised"]}",
                          style: TextStyle(
                            color: Colors.grey[500],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Icon(
                    Icons.star,
                    color: Colors.red[500],
                  ),
                  Text(
                    "${film["rt_score"]}%",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 15, right: 5),
              child: Row(
                children: [
                  FormattedButton(
                      text: "Review",
                      iconData: Icons.library_books,
                      onPress: () {}),
                  SizedBox(width: 10),
                  FormattedButton(
                      text: "Review",
                      iconData: Icons.library_books,
                      onPress: () {}),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(21),
              child: Text(
                'Director: ${film["director"]} \n'
                'Producer: ${film["producer"]}\n'
                'Release Year: ${film["release_date"]} \n'
                'Running Time: ${film["running_time"]} \n\n'
                'Synopsis: ${film["description"]}',
                softWrap: true,
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
          ],
        ));
  }

  Future addToWatchList() async {
    final watchList = WatchList(isWatched: false, filmID: film["id"]);

    await GhibiDatabase.instance.createWatchList(watchList);
  }
}
