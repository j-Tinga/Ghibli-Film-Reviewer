import 'package:cis2203_final_exam/database/ghibi_database.dart';
import 'package:cis2203_final_exam/models/review.dart';
import 'package:cis2203_final_exam/models/watchList.dart';
import 'package:cis2203_final_exam/widgets/FormattedButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class WatchListPage extends StatefulWidget {
  const WatchListPage({Key? key}) : super(key: key);

  @override
  _WatchListPageState createState() => _WatchListPageState();
}

class _WatchListPageState extends State<WatchListPage> {
  late List<WatchList?> watchList;
  bool isLoading = false;

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
    return Scaffold(
      appBar: AppBar(
        title: Text('Watch List'),
      ),
      body: ListView(children: [
        isLoading ? CircularProgressIndicator() : Text("yeh"),
        FormattedButton(
            text: "Review",
            iconData: Icons.library_books,
            onPress: () {
              print("Yey");
            }),
      ]),
    );
  }
}
