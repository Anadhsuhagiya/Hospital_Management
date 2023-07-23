import 'package:flutter/material.dart';
import 'package:realestate/data/globals.dart';

import '../widgets/text.dart';

class searchPage extends StatefulWidget {
  const searchPage({super.key});

  @override
  State<searchPage> createState() => _searchPageState();
}

class _searchPageState extends State<searchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kHomeBG,
      body: Center(
        child: textWidget(msg: "Appointment", txtColor: kBlack, txtFontWeight: FontWeight.w800, txtFontSize: 20),
      ),
    );
  }
}
