import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:wifi_status/src/pages/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Wifi Status",
      initialRoute: "/",
      routes: {"/": (BuildContext context) => HomePage()},
    );
  }
}
