import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:realestate/pages/searchPage.dart';

import '../data/Lists.dart';
import '../data/globals.dart';
import '../data/pageTransitions.dart';
import '../widgets/frostedGlass.dart';
import '../widgets/infoCard.dart';
import '../widgets/text.dart';
import 'TopDoctors.dart';

class FinalHome extends StatefulWidget {
  const FinalHome({super.key});

  @override
  State<FinalHome> createState() => _FinalHomeState();
}

class _FinalHomeState extends State<FinalHome> {

  var h , w;
  TextEditingController Search = TextEditingController();

  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;
    return Container(
        height: h,
        width: w,
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: w * 0.05,
                      ),
                      textWidget(
                          msg: "Hello,",
                          txtColor: kBlack,
                          txtFontWeight: FontWeight.w500,
                          txtFontSize: h * 0.025)
                    ],
                  ),
                  SizedBox(
                    height: h * 0.001,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: w * 0.05,
                      ),
                      textWidget(
                          msg: "Anadh Suhagiya",
                          txtColor: kBlack,
                          txtFontWeight: FontWeight.bold,
                          txtFontSize: h * 0.03)
                    ],
                  ),
                  Container(
                    height: h * 0.06,
                    width: w,
                    margin: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        color: kWhite,
                        borderRadius: BorderRadius.circular(18),
                        boxShadow: [
                          BoxShadow(
                              color: kBlack,
                              blurRadius: 10,
                              spreadRadius: -10,
                              offset: Offset(2, 4))
                        ]),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: w * 0.04,
                        ),
                        Image.asset(
                          'images/search.png',
                          width: w * 0.05,
                          color: kBlack,
                        ),
                        SizedBox(
                          width: w * 0.04,
                        ),
                        Container(
                          height: h * 0.06,
                          width: w * 0.7,
                          padding: EdgeInsets.only(top: 2),
                          child: TextField(
                            controller: Search,
                            keyboardType: TextInputType.name,
                            cursorColor: kBlack,
                            style: GoogleFonts.montserrat(
                                textStyle: TextStyle(
                                    color: kBlack,
                                    fontWeight: FontWeight.w600,
                                    fontSize: h * 0.018)),
                            onTap: () {

                              Navigator.push(context, FadeRoute1(searchPage()));
                              
                            },
                            onTapOutside: (event) =>
                                FocusScope.of(context).unfocus(),
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText:
                                "Search Disease , Medicine or Hospitals",
                                hintStyle: GoogleFonts.montserrat(
                                    textStyle: TextStyle(
                                        color: kBlack.withOpacity(0.3),
                                        fontWeight: FontWeight.w600,
                                        fontSize: h * 0.018))),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),

              SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [

                    Container(
                      height: h * 0.76,
                      width: w,
                      margin: EdgeInsets.only(top: h * 0.02),
                      decoration: BoxDecoration(
                          color: kWhite,
                          boxShadow: [
                            BoxShadow(
                                color: kBlack,
                                offset: Offset(-2, -4),
                                spreadRadius: -20,
                                blurRadius: 20)
                          ],
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(40),
                              topLeft: Radius.circular(40))),
                      child: Column(
                        children: [
                          SizedBox(
                            height: h * 0.035,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context, SlideTransition1(topDoctors()));
                            },
                            child: Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 30),
                                  child: textWidget(
                                      msg: "Top Doctor",
                                      txtColor: kBlack,
                                      txtFontWeight: FontWeight.bold,
                                      txtFontSize: h * 0.024),
                                ),
                                Padding(
                                    padding: const EdgeInsets.only(right: 30),
                                    child: Image.asset(
                                      "images/right-arrow.png",
                                      width: w * 0.04,
                                    )),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: h * 0.02,
                          ),
                          Container(
                            height: h * 0.3,
                            width: w,
                            child: ListView.builder(
                              itemCount: DoctorName.length,
                              scrollDirection: Axis.horizontal,
                              physics: BouncingScrollPhysics(),
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: () {

                                    showDialog(context: context, builder: (context) {
                                      return FrostedGlass(widget: InfoCard(index));
                                    },);
                                  },
                                  child: Container(
                                    height: h * 0.3,
                                    width: w * 0.4,
                                    margin: EdgeInsets.only(
                                        top: 15, left: 15, bottom: 15),
                                    decoration: BoxDecoration(
                                        color: DoctorColor[index],
                                        borderRadius:
                                        BorderRadius.circular(14),
                                        boxShadow: [
                                          BoxShadow(
                                              color: kBlack,
                                              blurRadius: 20,
                                              spreadRadius: -18,
                                              offset: Offset(2, 4))
                                        ]),
                                    child: Stack(
                                      children: [
                                        Column(
                                          mainAxisAlignment:
                                          MainAxisAlignment.end,
                                          children: [
                                            Image.asset(
                                              '${DoctorPics[index]}',
                                              fit: BoxFit.cover,
                                            ),
                                          ],
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                          MainAxisAlignment.end,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment.center,
                                              children: [
                                                Container(
                                                  height: h * 0.06,
                                                  width: w * 0.35,
                                                  margin: EdgeInsets.only(
                                                      bottom: 10),
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                      BorderRadius
                                                          .circular(8),
                                                      color: kWhite),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .center,
                                                    children: [
                                                      Row(
                                                        mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                        children: [
                                                          textWidget(
                                                              msg:
                                                              "${DoctorName[index]}",
                                                              txtColor:
                                                              kBlack,
                                                              txtFontWeight:
                                                              FontWeight
                                                                  .w700,
                                                              txtFontSize:
                                                              h * 0.014)
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        height: h * 0.003,
                                                      ),
                                                      Row(
                                                        mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                        children: [
                                                          textWidget(
                                                              msg:
                                                              "${DoctorSpeciality[index]}",
                                                              txtColor:
                                                              kBlack,
                                                              txtFontWeight:
                                                              FontWeight
                                                                  .w500,
                                                              txtFontSize:
                                                              h * 0.013)
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                          SizedBox(
                            height: h * 0.02,
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 15),
                                child: textWidget(
                                    msg: "What Do You Need ?",
                                    txtColor: kBlack,
                                    txtFontWeight: FontWeight.bold,
                                    txtFontSize: h * 0.023),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: h * 0.015,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                height: h * 0.13,
                                width: h * 0.13,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    color: kHomeBG,
                                    borderRadius: BorderRadius.circular(20),
                                    boxShadow: [
                                      BoxShadow(
                                          color: kBlack,
                                          offset: Offset(2, 4),
                                          spreadRadius: -17,
                                          blurRadius: 20)
                                    ]),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      'images/doctor1.png',
                                      width: w * 0.14,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(5),
                                      child: textWidget(
                                          msg: "Doctors",
                                          txtColor: kBlack,
                                          txtFontWeight: FontWeight.w600,
                                          txtFontSize: h * 0.02),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                height: h * 0.13,
                                width: h * 0.13,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    color: Color(0xffc4edc5),
                                    borderRadius: BorderRadius.circular(20),
                                    boxShadow: [
                                      BoxShadow(
                                          color: kBlack,
                                          offset: Offset(2, 4),
                                          spreadRadius: -17,
                                          blurRadius: 20)
                                    ]),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      'images/pills.png',
                                      width: w * 0.14,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(5),
                                      child: textWidget(
                                          msg: "Medicines",
                                          txtColor: kBlack,
                                          txtFontWeight: FontWeight.w600,
                                          txtFontSize: h * 0.02),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                height: h * 0.13,
                                width: h * 0.13,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    color: Color(0xffece3bf),
                                    borderRadius: BorderRadius.circular(20),
                                    boxShadow: [
                                      BoxShadow(
                                          color: kBlack,
                                          offset: Offset(2, 4),
                                          spreadRadius: -17,
                                          blurRadius: 20)
                                    ]),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      'images/appointment.png',
                                      width: w * 0.14,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(5),
                                      child: textWidget(
                                          msg: "Appointment",
                                          txtColor: kBlack,
                                          txtFontWeight: FontWeight.w600,
                                          txtFontSize: h * 0.017),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: h * 0.015,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                height: h * 0.13,
                                width: h * 0.13,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    color: Color(0xffece3bf),
                                    borderRadius: BorderRadius.circular(20),
                                    boxShadow: [
                                      BoxShadow(
                                          color: kBlack,
                                          offset: Offset(2, 4),
                                          spreadRadius: -17,
                                          blurRadius: 20)
                                    ]),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      'images/heartdisease.png',
                                      width: w * 0.14,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(5),
                                      child: textWidget(
                                          msg: "Disease",
                                          txtColor: kBlack,
                                          txtFontWeight: FontWeight.w600,
                                          txtFontSize: h * 0.02),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                height: h * 0.13,
                                width: h * 0.13,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    color: Color(0xffedc4c4),
                                    borderRadius: BorderRadius.circular(20),
                                    boxShadow: [
                                      BoxShadow(
                                          color: kBlack,
                                          offset: Offset(2, 4),
                                          spreadRadius: -17,
                                          blurRadius: 20)
                                    ]),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      'images/hospital.png',
                                      width: w * 0.14,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(5),
                                      child: textWidget(
                                          msg: "Hospitals",
                                          txtColor: kBlack,
                                          txtFontWeight: FontWeight.w600,
                                          txtFontSize: h * 0.02),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                height: h * 0.13,
                                width: h * 0.13,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    color: Color(0xffbfecdf),
                                    borderRadius: BorderRadius.circular(20),
                                    boxShadow: [
                                      BoxShadow(
                                          color: kBlack,
                                          offset: Offset(2, 4),
                                          spreadRadius: -17,
                                          blurRadius: 20)
                                    ]),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      'images/support.png',
                                      width: w * 0.14,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(5),
                                      child: textWidget(
                                          msg: "Help Desk",
                                          txtColor: kBlack,
                                          txtFontWeight: FontWeight.w600,
                                          txtFontSize: h * 0.017),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

            ],
          ),
        ),
      );
  }
}
