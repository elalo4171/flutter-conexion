import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selected;
  var subscription;
  PageController _pageController;
  getTypeOfConnection() async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      // I am connected to a mobile network.
      selected = 1;
      print("mobile");
      _pageController.jumpToPage(1);
    } else if (connectivityResult == ConnectivityResult.wifi) {
      // I am connected to a wifi network.
      selected = 2;
      print("wifi");

      _pageController.jumpToPage(2);
    } else {
      // i am no connected
      selected = 0;
      print("No connection");
      _pageController.jumpToPage(0);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController = new PageController();
    selected = 0;
    subscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      getTypeOfConnection();
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageView(
      physics: new NeverScrollableScrollPhysics(),
      controller: _pageController,
      children: <Widget>[
        Container(
          color: Colors.red,
          child: Center(
              child: Text(
            "desconectado",
            style: TextStyle(color: Colors.white),
          )),
        ),
        Container(
          color: Colors.green,
          child: Center(
              child: Text("modile", style: TextStyle(color: Colors.white))),
        ),
        Container(
          color: Colors.blue,
          child: Center(
              child: Text("wifi", style: TextStyle(color: Colors.white))),
        ),
      ],
    ));
  }
}
