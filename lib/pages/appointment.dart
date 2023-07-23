import 'package:flutter/material.dart';
import 'package:realestate/data/globals.dart';
import 'package:realestate/widgets/text.dart';

class appointment extends StatefulWidget {
  const appointment({super.key});

  @override
  State<appointment> createState() => _appointmentState();
}

class _appointmentState extends State<appointment> {
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
