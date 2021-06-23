import 'dart:convert';
import 'package:cis2203_final_exam/classes/filmImages.dart';
import 'package:cis2203_final_exam/database/ghibi_database.dart';
import 'package:cis2203_final_exam/models/review.dart';
import 'package:cis2203_final_exam/pages/login.dart';
import 'package:cis2203_final_exam/widgets/reviewCard.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class ReviewsPage extends StatefulWidget {
  const ReviewsPage({Key? key}) : super(key: key);

  @override
  _ReviewsPageState createState() => _ReviewsPageState();
}

class _ReviewsPageState extends State<ReviewsPage> {
  late List<Review?> reviews;
  bool isLoading = false;
  final url = "https://ghibliapi.herokuapp.com/films";
  var _filmData = [];
  var _filmPosters = new filmImage();

  //http get Ghilbli Film data from API
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
  void initState() {
    super.initState();
    refreshReviews();
  }

  Future refreshReviews() async {
    setState(() => isLoading = true);
    this.reviews = await GhibiDatabase.instance.readAllReviews();
    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    fetchFilms();
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Reviews"),
        ),
        actions: [
          IconButton(
            onPressed: logout,
            icon: Icon(Icons.logout),
          )
        ],
        automaticallyImplyLeading: false,
      ),
      body: isLoading
          ? Container(
              alignment: Alignment.center,
              child: CircularProgressIndicator(),
            )
          : _filmData.isEmpty
              ? Container(
                  alignment: Alignment.center,
                  child: CircularProgressIndicator(),
                )
              : reviews.isEmpty
                  ? Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 35.0, vertical: 20.0),
                      alignment: Alignment.center,
                      child: Text(
                        "No Reviews found",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 21,
                        ),
                      ),
                    )
                  : ListView.builder(
                      itemCount: reviews.length + 1,
                      itemBuilder: (context, i) {
                        if (i == 0) {
                          return Container(
                            height: 40,
                            padding: new EdgeInsets.all(5),
                            margin: new EdgeInsets.all(15),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.blueAccent),
                                borderRadius: BorderRadius.circular(15)),
                            child: Title(
                              child: (Text(
                                "Ghlibli Films Reviewed ${reviews.length}/21",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 23,
                                ),
                              )),
                              color: Colors.white,
                            ),
                          );
                        } else {
                          return ReviewCard(
                              imageUrl: _filmPosters
                                  .getFilmImages[reviews[i - 1]!.filmIndex],
                              filmTitle: _filmData[reviews[i - 1]!.filmIndex]
                                  ["title"],
                              review: reviews[i - 1]);
                        }
                      },
                    ),
    );
  }

  void logout() {
    Navigator.pushNamed(context, Login.routeName);
  }
}
