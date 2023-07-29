import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../data/globals.dart';

class appointmentForm extends StatefulWidget {
  const appointmentForm({super.key});

  @override
  State<appointmentForm> createState() => _appointmentFormState();
}

class _appointmentFormState extends State<appointmentForm> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      backgroundColor: kWhite.withOpacity(0.6),
      content: Container(
      ),
    );
  }
}
