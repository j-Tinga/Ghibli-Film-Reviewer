import 'package:flutter/cupertino.dart';

import 'pages/FilmPage.dart';
import 'pages/MainPage.dart';

final Map<String, WidgetBuilder> routes = {
  FilmPage.routeName: (BuildContext context) => FilmPage(
        film: {},
        filmIndex: 0,
        filmPoster: '',
      ),
  MainPage.routeName: (BuildContext context) => MainPage(),
};
