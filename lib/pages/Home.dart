import 'package:carbon_icons/carbon_icons.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:realestate/data/Lists.dart';
import 'package:realestate/data/globals.dart';
import 'package:realestate/pages/TopDoctors.dart';
import 'package:realestate/widgets/text.dart';
import 'package:unicons/unicons.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var h, w;

  TextEditingController Search = TextEditingController();

  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: kHomeBG,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        // flexibleSpace: Container(
        //   decoration:
        //       BoxDecoration(gradient: LinearGradient(colors: AppbarGrad)),
        // ),
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            if (ZoomDrawer.of(context)!.isOpen()) {
              ZoomDrawer.of(context)!.close();
            } else {
              ZoomDrawer.of(context)!.open();
            }
          },
          child: Container(
              height: h * 0.03,
              width: w * 0.03,
              padding: EdgeInsets.all(17),
              child: Image.asset(
                'images/menu.png',
                width: w * 0.03,
                color: kDarkBlue3,
              )),
        ),
        title: Text("",
            style: GoogleFonts.montserrat(
                textStyle: TextStyle(
                    fontSize: h * 0.025,
                    fontWeight: FontWeight.bold,
                    color: kWhite))),
        actions: [
          Container(
            height: h * 0.01,
            width: w * 0.12,
            margin: EdgeInsets.only(right: 20, top: 5, bottom: 5),
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(13),
              color: kDarkBlue3,
              boxShadow: [
                BoxShadow(color: kBlack, spreadRadius: -12, blurRadius: 20)
              ],
            ),
            child: Image.asset(
              'images/man.png',
              fit: BoxFit.cover,
            ),
          )
        ],
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(height: h * 0.19,),
                Container(
                  height: h * 0.7,
                  width: w,
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
                          Navigator.push(context, SlideTransition1(topDoctors()));
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                Navigator.push(
                                    context, SlideTransition1(topDoctors()));
                              },
                              child: Container(
                                height: h * 0.3,
                                width: w * 0.4,
                                margin:
                                    EdgeInsets.only(top: 15, left: 15, bottom: 15),
                                decoration: BoxDecoration(
                                    color: DoctorColor[index],
                                    borderRadius: BorderRadius.circular(14),
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
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Image.asset(
                                          '${DoctorPics[index]}',
                                          fit: BoxFit.cover,
                                        ),
                                      ],
                                    ),
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Container(
                                              height: h * 0.06,
                                              width: w * 0.35,
                                              margin: EdgeInsets.only(bottom: 10),
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                  color: kWhite),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.center,
                                                    children: [
                                                      textWidget(
                                                          msg:
                                                              "${DoctorName[index]}",
                                                          txtColor: kBlack,
                                                          txtFontWeight:
                                                              FontWeight.w700,
                                                          txtFontSize: h * 0.014)
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: h * 0.003,
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.center,
                                                    children: [
                                                      textWidget(
                                                          msg:
                                                              "${DoctorSpeciality[index]}",
                                                          txtColor: kBlack,
                                                          txtFontWeight:
                                                              FontWeight.w500,
                                                          txtFontSize: h * 0.013)
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
                    ],
                  ),
                ),
              ],
            ),
          ),
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
                        onTapOutside: (event) =>
                            FocusScope.of(context).unfocus(),
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Search",
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
        ],
      ),
    );
  }
}

class SlideTransition1 extends PageRouteBuilder {
  final Widget page;

  SlideTransition1(this.page)
      : super(
            pageBuilder: (context, animation, anotherAnimation) => page,
            transitionDuration: Duration(milliseconds: 1000),
            reverseTransitionDuration: Duration(milliseconds: 400),
            transitionsBuilder: (context, animation, anotherAnimation, child) {
              animation = CurvedAnimation(
                  curve: Curves.fastLinearToSlowEaseIn,
                  parent: animation,
                  reverseCurve: Curves.fastOutSlowIn);
              return SlideTransition(
                position: Tween(begin: Offset(1.0, 0.0), end: Offset(0.0, 0.0))
                    .animate(animation),
                child: page,
              );
            });
}
