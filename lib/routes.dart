import 'package:cis2203_final_exam/pages/login.dart';
import 'package:cis2203_final_exam/pages/reviewPage.dart';
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
  Login.routeName: (BuildContext context) => Login(),
  ReviewPage.routeName: (BuildContext context) => ReviewPage(
        film: {},
        filmIndex: 0,
        filmPoster: '',
      ),
};
