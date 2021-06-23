import 'package:cis2203_final_exam/database/ghibi_database.dart';
import 'package:cis2203_final_exam/mixins/ValidationMixin.dart';
import 'package:cis2203_final_exam/models/watchList.dart';
import 'package:cis2203_final_exam/pages/WriteReviewPage.dart';
import 'package:cis2203_final_exam/widgets/FormattedButton.dart';
import 'package:flutter/material.dart';

class ListedFilmPage extends StatelessWidget with ValidationMixin {
  final Map film;
  final int filmIndex;
  final String filmPoster;

  const ListedFilmPage(
      {Key? key,
      required this.film,
      required this.filmIndex,
      required this.filmPoster})
      : super(key: key);
  static const String routeName = "FilmPage";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
                      iconData: Icons.star,
                      onPress: () {
                        navsToReviewPage(context);
                      },
                    ),
                    SizedBox(width: 10),
                    FormattedButton(
                        text: "Watch List",
                        iconData: Icons.remove_circle,
                        onPress: () {
                          removeFromWatchList(context);
                        }),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(21),
                child: Text(
                  'Director: ${film["director"]} \n'
                  'Producer: ${film["producer"]}\n'
                  'Release Year: ${film["release_date"]} \n'
                  'Running Time: ${film["running_time"]} minutes \n\n'
                  'Synopsis: ${film["description"]}',
                  softWrap: true,
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
            ],
          )),
    );
  }

  Future removeFromWatchList(context) async {
    var snackBarText, snackBarlabel;
    if (await GhibiDatabase.instance.readWatchList(filmIndex) != null) {
      await GhibiDatabase.instance.deleteWatchList(filmIndex);
      snackBarText = "Film removed from watch list";
      snackBarlabel = "Undo";
    } else {
      snackBarText = "Film already removed from watch list";
      snackBarlabel = "Add Back";
    }

    final snackBar = SnackBar(
      content: Text(snackBarText),
      duration: Duration(seconds: 1, milliseconds: 500),
      action: SnackBarAction(
        textColor: Colors.blue,
        label: snackBarlabel,
        onPressed: () {
          addToWatchList(context);
        },
      ),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  Future addToWatchList(context) async {
    var snackBarText;
    if (await GhibiDatabase.instance.readWatchList(filmIndex) != null) {
      snackBarText = "Film already in watch list";
    } else {
      final watchList = WatchList(isWatched: false, filmIndex: filmIndex);
      await GhibiDatabase.instance.createWatchList(watchList);
      snackBarText = "Film added back to watch list";
    }

    final snackBar = SnackBar(
      content: Text(snackBarText),
      duration: Duration(seconds: 1, milliseconds: 500),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void navsToReviewPage(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => WriteReviewPage(
          film: film,
          filmIndex: filmIndex,
          filmPoster: filmPoster,
        ),
      ),
    );
  }
}
