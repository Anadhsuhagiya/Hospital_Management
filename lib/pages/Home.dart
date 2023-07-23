import 'dart:developer';

import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:carbon_icons/carbon_icons.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:realestate/data/Lists.dart';
import 'package:realestate/data/globals.dart';
import 'package:realestate/data/pageTransitions.dart';
import 'package:realestate/pages/TopDoctors.dart';
import 'package:realestate/pages/searchPage.dart';
import 'package:realestate/widgets/frostedGlass.dart';
import 'package:realestate/widgets/infoCard.dart';
import 'package:realestate/widgets/text.dart';
import 'package:unicons/unicons.dart';

import 'appointment.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var h, w;

  TextEditingController Search = TextEditingController();

  /// Controller to handle PageView and also handles initial page
  var _pageController = PageController(initialPage: 2);

  /// Controller to handle bottom nav bar and also handles initial page
  var _controller = NotchBottomBarController(index: 2);

  int maxCount = 5;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: kHomeBG,
      bottomNavigationBar:  AnimatedNotchBottomBar(
        /// Provide NotchBottomBarController
        notchBottomBarController: _controller,
        color: Colors.white,
        showLabel: false,
        notchColor: kDarkBlue3,

        /// restart app if you change removeMargins
        removeMargins: false,
        bottomBarWidth: 500,
        durationInMilliSeconds: 300,
        bottomBarItems: [

           BottomBarItem(
            inActiveItem: Image.asset(
              'images/search.png',
              color: Colors.blueGrey,
            ),
            activeItem: Image.asset(
              'images/search.png',
              color: Colors.white,
            ),
            itemLabel: 'Page 1',
          ),


          BottomBarItem(
            inActiveItem: Image.asset(
              'images/calendar.png',
              color: Colors.blueGrey,
            ),
            activeItem: Image.asset(
              'images/calendar.png',
              color: Colors.white,
            ),
            itemLabel: 'Page 3',
          ),
          BottomBarItem(
            inActiveItem: Image.asset(
              'images/home1.png',
              color: Colors.blueGrey,
            ),
            activeItem: Image.asset(
              'images/home1.png',
              color: Colors.white,
            ),
            itemLabel: 'Page 2',
          ),
           BottomBarItem(
             inActiveItem: Image.asset(
               'images/doctor2.png',
               color: Colors.blueGrey,
             ),
             activeItem: Image.asset(
               'images/doctor2.png',
               color: Colors.white,
             ),
            itemLabel: 'Page 4',
          ),
           BottomBarItem(
             inActiveItem: Image.asset(
               'images/settings.png',
               color: Colors.blueGrey,
             ),
             activeItem: Image.asset(
               'images/settings.png',
               color: Colors.white,
             ),
            itemLabel: 'Page 5',
          ),
        ],
        onTap: (index) {
          /// perform action on tab change and to update pages you can update pages without pages
          log('current selected index $index');
          _pageController.animateToPage(
            index,
            duration: Duration(milliseconds: 400),
            curve: Curves.easeInOut,
          );
        },
      ),


      // StylishBottomBar(
      //   backgroundColor: kWhite,
      //     elevation: 10,
      //     items: [
      //       BottomBarItem(
      //
      //           icon: Icon(EvaIcons.home,color: kBlack,),
      //           title: textWidget(
      //               msg: "Home",
      //               txtColor: kBlack,
      //               txtFontWeight: FontWeight.w600,
      //               txtFontSize: h * 0.019),
      //         selectedColor: Color(0xffd4c4ed),
      //         backgroundColor: Color(0xffd4c4ed),
      //         showBadge: true,
      //       ),
      //       BottomBarItem(
      //         icon: Icon(EvaIcons.calendar,color: kBlack,),
      //         title: textWidget(
      //             msg: "Appointment",
      //             txtColor: kBlack,
      //             txtFontWeight: FontWeight.w600,
      //             txtFontSize: h * 0.019),
      //         selectedColor: Color(0xffc4edc5),
      //         backgroundColor: Color(0xffc4edc5),
      //         showBadge: true,
      //       ),
      //       BottomBarItem(
      //
      //         icon: Icon(EvaIcons.settings2,color: kBlack,),
      //         title: textWidget(
      //             msg: "Settings",
      //             txtColor: kBlack,
      //             txtFontWeight: FontWeight.w600,
      //             txtFontSize: h * 0.019),
      //         selectedColor: Color(0xffece3bf),
      //         backgroundColor: Color(0xffece3bf),
      //         showBadge: true,
      //       ),
      //     ],
      //     currentIndex: selected,
      //     onTap: (index) {
      //       setState(() {
      //         selected = index;
      //         controller.animateToPage(
      //           index,
      //           duration: Duration(milliseconds: 300),
      //           curve: Curves.easeInOut,
      //         );
      //       });
      //     },
      //     option: BubbleBarOptions(
      //         barStyle: BubbleBarStyle.horizotnal,
      //         bubbleFillStyle: BubbleFillStyle.fill)),
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
      extendBody: true,
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: _pageController,
        children: [

          searchPage(),
          appointment(),
          Container(
            height: h,
            width: w,
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  Stack(
                    children: [
                      SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [

                            Container(
                              height: h * 0.85,
                              width: w,
                              margin: EdgeInsets.only(top: h * 0.17),
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
                    ],
                  ),
                ],
              ),
            ),
          ),
          Center(child: Icon(CarbonIcons.settings,color: kBlack,),),
          Center(child: Icon(CarbonIcons.settings,color: kBlack,),),
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
