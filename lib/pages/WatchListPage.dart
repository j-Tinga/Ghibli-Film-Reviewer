import 'package:cis2203_final_exam/database/ghibi_database.dart';
import 'package:cis2203_final_exam/models/review.dart';
import 'package:cis2203_final_exam/models/watchList.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class WatchListPage extends StatefulWidget {
  const WatchListPage({Key? key}) : super(key: key);

  @override
  _WatchListPageState createState() => _WatchListPageState();
}

class _WatchListPageState extends State<WatchListPage> {
  late List<WatchList?> watchList;

  @override
  void initState() {
    super.initState();

    refreshWatchList();
  }

  @override
  void dispose() {
    GhibiDatabase.instance.close();

    super.dispose();
  }

  Future refreshWatchList() async {
    this.watchList = await GhibiDatabase.instance.readAllWatchList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('The test is ${watchList[1]!.filmID.toString()}.'),
      ),
      body: ListView(children: [
        Container(),
      ]),
    );
  }
}
