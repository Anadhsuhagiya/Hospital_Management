import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:realestate/data/Model.dart';
import 'package:realestate/pages/Drawer/drawerScreen.dart';
import 'package:realestate/pages/onBoardUi.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Home.dart';

class splash extends StatefulWidget {
  const splash({super.key});

  @override
  State<splash> createState() => _splashState();
}

class _splashState extends State<splash> {
  var h, w;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    go();

  }

  go() async {

    Model.prefs = await SharedPreferences.getInstance();

    await Future.delayed(Duration(seconds: 4));

    int status = Model.prefs!.getInt('signIN') ?? 0;


    if(status == 1)
    {
      Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (context) {
          return drawerScreen();
        },
      ));
    }
    else{
      Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (context) {
          return onBoardUI();
        },
      ));
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Height , width from MediaQuery
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Lottie.network(
          "https://assets4.lottiefiles.com/packages/lf20_cbajnb2e.json",
          frameRate: FrameRate(120),
          width: w * 0.8,
        ),
      ),
    );
  }
}
