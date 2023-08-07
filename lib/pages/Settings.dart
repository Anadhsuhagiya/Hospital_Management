import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:realestate/data/globals.dart';
import 'package:realestate/widgets/settingContainers.dart';
import 'package:realestate/widgets/text.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  
  var h , w;
  
  @override
  Widget build(BuildContext context) {
    
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;
    
    return Scaffold(
      backgroundColor: kHomeBG,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Lottie.network("https://lottie.host/8e46a603-9d73-4681-8bfa-c1afc03370d0/QdW72FctqA.json",width: w * 0.3),
                textWidget(msg: "Settings", txtColor: kDarkBlue3, txtFontWeight: FontWeight.bold, txtFontSize: h * 0.03)
              ],
            ),
            Row(
              children: [
                SizedBox(height: h * 0.03,),
              ],
            ),

            settingsContainer(Aicon: "images/about.png", Aname: "About Us"),
            SizedBox(height: h * 0.018,),

            settingsContainer(Aicon: "images/contactUs.png", Aname: "Contact Us"),
            SizedBox(height: h * 0.018,),

            settingsContainer(Aicon: "images/faq.png", Aname: "FAQs"),
            SizedBox(height: h * 0.018,),

            settingsContainer(Aicon: "images/terms.png", Aname: "Terms & Conditions"),
            SizedBox(height: h * 0.018,),

            settingsContainer(Aicon: "images/privacy.png", Aname: "Privacy Policy"),
            SizedBox(height: h * 0.018,),

            settingsContainer(Aicon: "images/logout.png", Aname: "Log Out"),
            SizedBox(height: h * 0.018,)
          ],
        ),
      ),
    );
  }
}
