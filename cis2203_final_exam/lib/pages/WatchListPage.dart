import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class WatchListPage extends StatefulWidget {
  const WatchListPage({Key? key}) : super(key: key);

  @override
  _WatchListPageState createState() => _WatchListPageState();
}

class _WatchListPageState extends State<WatchListPage> {
  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Watch List"),
      ),
      body: ListView(children: [
        Container(
          child: TextFormField(
              controller: _controller,
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              decoration: InputDecoration(
                  labelText: "whatever you want",
                  hintText: "whatever you want",
                  icon: Icon(Icons.phone_iphone))),
        ),
      ]),
    );
  }
}
