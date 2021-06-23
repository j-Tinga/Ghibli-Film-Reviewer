import 'dart:convert';
import 'package:cis2203_final_exam/classes/filmImages.dart';
import 'package:cis2203_final_exam/database/ghibi_database.dart';
import 'package:cis2203_final_exam/models/watchList.dart';
import 'package:cis2203_final_exam/pages/login.dart';
import 'package:cis2203_final_exam/widgets/WatchListCard.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class WatchListPage extends StatefulWidget {
  const WatchListPage({Key? key}) : super(key: key);

  @override
  _WatchListPageState createState() => _WatchListPageState();
}

class _WatchListPageState extends State<WatchListPage> {
  late List<WatchList?> watchList;
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
    refreshWatchList();
  }

  Future refreshWatchList() async {
    setState(() => isLoading = true);
    this.watchList = await GhibiDatabase.instance.readAllWatchList();
    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    fetchFilms();
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text("Watch List")),
          automaticallyImplyLeading: false,
          actions: [
            IconButton(
              onPressed: logout,
              icon: Icon(Icons.logout),
            )
          ],
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
                : watchList.isEmpty
                    ? Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 35.0, vertical: 20.0),
                        alignment: Alignment.center,
                        child: Text(
                          "Put some films in your Watch List through the Library",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 21,
                          ),
                        ),
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
                        itemCount: watchList.length,
                        itemBuilder: (context, i) {
                          final film = _filmData[watchList[i]!.filmIndex];
                          final filmImage = _filmPosters
                              .getFilmImages[watchList[i]!.filmIndex];
                          return WatchListCard(
                              film: film,
                              filmIndex: watchList[i]!.filmIndex,
                              imageUrl: filmImage);
                        },
                      ));
  }

  void logout() {
    Navigator.pushNamed(context, Login.routeName);
  }
}
