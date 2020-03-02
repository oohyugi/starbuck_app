import 'package:flutter/material.dart';
import 'package:starbuck_app/containertest.dart';
import 'package:starbuck_app/helper/helper.dart';
import 'package:starbuck_app/feature/home.dart';
import 'package:starbuck_app/widget/test_responsive.dart';

import 'helper/screen_utils.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          primaryColor: HexColor("#006241"),
          accentColor: HexColor("#DBAE68"),
          backgroundColor: Colors.white,
          fontFamily: 'Montserrat',
          textTheme: TextTheme(title: TextStyle(fontWeight: FontWeight.w700)),
          buttonTheme: ButtonThemeData(
              buttonColor: HexColor("#006241"),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ))),
      home: HomePage(),
    );
  }
}
