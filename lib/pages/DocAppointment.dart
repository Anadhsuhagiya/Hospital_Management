

import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../data/Lists.dart';
import '../data/Model.dart';
import '../data/calanderData.dart';
import '../data/globals.dart';
import 'package:http/http.dart' as http;
import '../widgets/appointmentForm.dart';
import '../widgets/frostedGlass.dart';
import '../widgets/text.dart';

class DocAppointment extends StatefulWidget {

  String doctorsList;
  String doctorsList1;

  DocAppointment(this.doctorsList, this.doctorsList1);


  @override
  State<DocAppointment> createState() => _DocAppointmentState();
}

class _DocAppointmentState extends State<DocAppointment> {
  var h, w;

  TextEditingController disease = TextEditingController();

  int? SelectDateIndex;
  int? SelectTimeIndex;
  int? SelectDoctorIndex;

  List<String> selectDate = [];
  List<String> selectTime = [];
  List<String> selectDoctor = [];

  String ID = "";
  var appoData;
  bool status = false;

  getID() {
    ID = Model.prefs!.getString('id') ?? "";
  }

  Anadh() async {
    try {
      var link = 'https://flutteranadh.000webhostapp.com/Hospital/getAppointment.php';

      Map map = {
        'id': ID
      };

      var url = Uri.parse(link);
      var response = await http.post(url, body: map);
      print("response :- $response");

      print(response.statusCode);
      print("response :-===  ${response.body}");

      if (response.statusCode == 200 || response.statusCode == 201) {
        print('=== ${response.body}');
        // appoData = response.data;
        print("Anadh : ${response.body}");
        // print("lenght = ${appoData.length}");

        Map map = jsonDecode(response.body);

        appoData = map["data"];
        print("ANADH :  $appoData");

        status = true;
        setState(() {});
      } else {
        throw Exception('lenght : ${response.statusCode}');
      }
    } catch (e) {
      debugPrint('$e');
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getID();
    Anadh();
  }

  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;

    DateTime today = DateTime.now();
    DateTime nextMonth = DateTime(today.year, today.month + 1, 1);
    DateTime lastDayNextMonth =
    DateTime(nextMonth.year, nextMonth.month + 1, 0);

    List<String> dateList = generateDateList(today, lastDayNextMonth);
    List<String> weekdayNames = getWeekdayNames();

    return SafeArea(

      child: Scaffold(
          backgroundColor: kHomeBG,


          appBar: PreferredSize(
            child: Container(
              child: ClipRRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                  child: Container(
                    width: w,
                    height: h * 0.1,
                    decoration: BoxDecoration(color: kDarkBlue3, boxShadow: [
                      BoxShadow(color: kBlack, blurRadius: 20, spreadRadius: -17)
                    ]),
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 0),
                          child: textWidget(
                              msg: "Doctor Appointment",
                              txtColor: kWhite,
                              txtFontWeight: FontWeight.w600,
                              txtFontSize: h * 0.025),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            preferredSize: Size(w, h * 0.065),
          ),

          body: status
              ? Container(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  SizedBox(
                    height: h * 0.02,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: w * 0.05,
                          ),
                          textWidget(
                              msg: "Schedule",
                              txtColor: kBlack,
                              txtFontWeight: FontWeight.bold,
                              txtFontSize: h * 0.027)
                        ],
                      ),

                    ],
                  ),
                  SizedBox(
                    height: h * 0.01,
                  ),
                  Container(
                    height: h * 0.13,
                    width: w,
                    child: ListView.builder(
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: dateList.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {

                            if(selectDate.isEmpty){
                              SelectDateIndex = index;
                              selectDate.add("${dateList[index].substring(8, 10)} ${weekdayNames[DateTime.parse(dateList[index]).weekday - 1].substring(0, 3)}");
                            }
                            else{
                              SelectDateIndex = null;
                              selectDate.removeLast();
                            }
                            setState(() {});
                          },
                          child: Container(
                            height: h * 0.09,
                            width: w * 0.15,
                            alignment: Alignment.center,
                            margin: EdgeInsets.only(left: 15, top: 10, bottom: 10),
                            decoration: BoxDecoration(
                              color: SelectDateIndex == index ? kDarkBlue3.withOpacity(0.2) : kWhite.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(20),
                              border: SelectDateIndex == index
                                  ? Border.all(color: kDarkBlue3, width: 2)
                                  : null,
                              // boxShadow: [
                              //   BoxShadow(
                              //       color: kBlack,
                              //       offset: Offset(2, 4),
                              //       blurRadius: 20,
                              //       spreadRadius: -17)
                              // ],
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(5),
                                  child: textWidget(
                                      msg: "${dateList[index].substring(8, 10)}",
                                      txtColor: kBlack,
                                      txtFontWeight: FontWeight.w700,
                                      txtFontSize: h * 0.02),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(5),
                                  child: textWidget(
                                      msg:
                                      "${weekdayNames[DateTime.parse(dateList[index]).weekday - 1].substring(0, 3)}",
                                      txtColor: kBlack,
                                      txtFontWeight: FontWeight.w700,
                                      txtFontSize: h * 0.02),
                                ),
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: w * 0.05,
                          ),
                          textWidget(
                              msg: "Timing",
                              txtColor: kBlack,
                              txtFontWeight: FontWeight.bold,
                              txtFontSize: h * 0.027)
                        ],
                      ),


                    ],
                  ),
                  Container(
                    height: h * 0.07,
                    width: w,
                    child: ListView.builder(
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: Timing.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {

                            if(selectTime.isEmpty){
                              SelectTimeIndex = index;
                              selectTime.add(Timing[index]);
                            }
                            else{
                              SelectTimeIndex = null;
                              selectTime.removeLast();
                            }
                            setState(() {});
                          },
                          child: Container(
                            height: h * 0.06,
                            width: w * 0.3,
                            alignment: Alignment.center,
                            margin: EdgeInsets.only(left: 15, top: 10, bottom: 10),
                            decoration: BoxDecoration(
                                color: SelectTimeIndex == index ? kDarkBlue3.withOpacity(0.2) : kWhite.withOpacity(0.5),
                                borderRadius: BorderRadius.circular(14),
                                border: SelectTimeIndex == index
                                    ? Border.all(color: kDarkBlue3, width: 2)
                                    : null
                              // boxShadow: [
                              //   BoxShadow(
                              //       color: kBlack,
                              //       offset: Offset(2, 4),
                              //       blurRadius: 20,
                              //       spreadRadius: -17)
                              // ],
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(5),
                              child: textWidget(
                                  msg: "${Timing[index]}",
                                  txtColor: kBlack,
                                  txtFontWeight: FontWeight.w700,
                                  txtFontSize: h * 0.02),
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: w * 0.05,
                          ),
                          textWidget(
                              msg: "Doctors",
                              txtColor: kBlack,
                              txtFontWeight: FontWeight.bold,
                              txtFontSize: h * 0.027)
                        ],
                      ),

                    ],
                  ),
                  Container(
                    height: h * 0.16,
                    width: w,
                    child: Stack(
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                  height: h * 0.09,
                                  width: w * 0.7,
                                  alignment: Alignment.centerRight,
                                  margin: EdgeInsets.only(left: 15),
                                  padding: EdgeInsets.only(right: 10),
                                  decoration: BoxDecoration(
                                      color: kDarkBlue3.withOpacity(0.2),
                                      borderRadius: BorderRadius.circular(14),
                                      border: Border.all(color: kDarkBlue3, width: 2)
                                    // boxShadow: [
                                    //   BoxShadow(
                                    //       color: kBlack,
                                    //       offset: Offset(2, 4),
                                    //       blurRadius: 20,
                                    //       spreadRadius: -17)
                                    // ],
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.all(5),
                                        child: textWidget(
                                            msg: "${widget.doctorsList}",
                                            txtColor: kBlack,
                                            txtFontWeight: FontWeight.w700,
                                            txtFontSize: h * 0.018),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.all(5),
                                        child: textWidget(
                                            msg: "${widget.doctorsList1}",
                                            txtColor: kBlack,
                                            txtFontWeight: FontWeight.w500,
                                            txtFontSize: h * 0.016),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              height: h * 0.18,
                              width: w * 0.25,
                              margin: EdgeInsets.only(top: 15, left: 25),
                              child: Image.asset('${DoctorPics[0]}'),
                            )
                          ],
                        )
                  ),
                  SizedBox(
                    height: h * 0.025,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: w * 0.05,
                      ),
                      textWidget(
                          msg: "Common Disease",
                          txtColor: kBlack,
                          txtFontWeight: FontWeight.bold,
                          txtFontSize: h * 0.027)
                    ],
                  ),
                  Container(
                    height: h * 0.06,
                    width: w,
                    margin: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        color: kWhite,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                              color: kBlack,
                              blurRadius: 10,
                              spreadRadius: -10,
                              offset: Offset(2, 4))
                        ]),
                    child: Container(
                      height: h * 0.06,
                      width: w * 0.7,
                      padding: EdgeInsets.only(top: 2, left: 15),
                      child: TextField(
                        controller: disease,
                        keyboardType: TextInputType.name,
                        cursorColor: kBlack,
                        style: GoogleFonts.montserrat(
                            textStyle: TextStyle(
                                color: kBlack,
                                fontWeight: FontWeight.w600,
                                fontSize: h * 0.018)),
                        onTap: () {},
                        onTapOutside: (event) => FocusScope.of(context).unfocus(),
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Mention your Commom Disease",
                            hintStyle: GoogleFonts.montserrat(
                                textStyle: TextStyle(
                                    color: kBlack.withOpacity(0.3),
                                    fontWeight: FontWeight.w600,
                                    fontSize: h * 0.018))),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: h * 0.02,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: w * 0.05,
                      ),
                      textWidget(
                          msg: "Note :",
                          txtColor: kBlack,
                          txtFontWeight: FontWeight.bold,
                          txtFontSize: h * 0.027)
                    ],
                  ),
                  SizedBox(
                    height: h * 0.01,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: w * 0.05,
                      ),
                      textWidget(
                          msg: "- Carry Case File.",
                          txtColor: kBlack,
                          txtFontWeight: FontWeight.w500,
                          txtFontSize: h * 0.015),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: w * 0.05,
                      ),
                      textWidget(
                          msg: "- Be Safe and stay Home.",
                          txtColor: kBlack,
                          txtFontWeight: FontWeight.w500,
                          txtFontSize: h * 0.015),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: w * 0.05,
                      ),
                      textWidget(
                          msg: "- Provide accurate information.",
                          txtColor: kBlack,
                          txtFontWeight: FontWeight.w500,
                          txtFontSize: h * 0.015),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: w * 0.05,
                      ),
                      textWidget(
                          msg: "- Bring necessary documents.",
                          txtColor: kBlack,
                          txtFontWeight: FontWeight.w500,
                          txtFontSize: h * 0.015),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: w * 0.05,
                      ),
                      textWidget(
                          msg: "- Mention Reason for an Appointment.",
                          txtColor: kBlack,
                          txtFontWeight: FontWeight.w500,
                          txtFontSize: h * 0.015),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: w * 0.05,
                      ),
                      textWidget(
                          msg: "- Follow the respective instructions.",
                          txtColor: kBlack,
                          txtFontWeight: FontWeight.w500,
                          txtFontSize: h * 0.015),
                    ],
                  ),
                  InkWell(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () {

                      String appoDate = selectDate.isEmpty ? "" : selectDate[0];
                      String appoTime = selectTime.isEmpty ? "" : selectTime[0];
                      String appoDoctor = selectDoctor.isEmpty ? "" : selectDoctor[0];
                      String reason = disease.text.trim();

                      if(appoDate.isEmpty){
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12)),
                            width: w * 0.9,
                            behavior: SnackBarBehavior.floating,
                            content: Text(
                              'Select Appointment Date',
                              style: GoogleFonts.montserrat(
                                  textStyle: TextStyle(
                                      color: kWhite,
                                      fontWeight: FontWeight.bold)),
                            ),
                            backgroundColor: kError,
                            duration: Duration(seconds: 1),
                          ),
                        );
                      }
                      else if(appoTime.isEmpty){
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12)),
                            width: w * 0.9,
                            behavior: SnackBarBehavior.floating,
                            content: Text(
                              'Select Appointment Time',
                              style: GoogleFonts.montserrat(
                                  textStyle: TextStyle(
                                      color: kWhite,
                                      fontWeight: FontWeight.bold)),
                            ),
                            backgroundColor: kError,
                            duration: Duration(seconds: 1),
                          ),
                        );
                      }
                      else{
                        String aDate = "";
                        String aTime = "";

                        for(int i = 0; i<appoDate.length; i++){
                          if(appoData[i]["adate"] == appoDate && appoData[i]["atime"] == appoTime){
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(

                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12)),
                                width: w * 0.9,
                                behavior: SnackBarBehavior.floating,
                                content: Text(
                                  'Appointment is Already Booked for this Time Period\nPlease Select Another Date or Time Slot',
                                  style: GoogleFonts.montserrat(
                                      textStyle: TextStyle(
                                          color: kWhite,
                                          fontWeight: FontWeight.bold)),
                                ),
                                backgroundColor: kError,
                                duration: Duration(seconds: 5),
                              ),
                            );
                            aDate = appoData[i]["adate"];
                            aTime = appoData[i]["atime"];
                            break;
                          }
                        }

                        if(aDate.isEmpty && aTime.isEmpty){
                          showDialog(
                            barrierDismissible: false,
                            context: context,
                            builder: (context) {
                              return FrostedGlass(widget: appointmentForm(appoDate,appoTime,appoDoctor,reason));
                            },
                          );
                        }


                      }


                    },
                    child: Container(
                      height: h * 0.07,
                      width: w,
                      alignment: Alignment.center,
                      margin:
                      EdgeInsets.only(left: 15, right: 15, top: 20, bottom: 20),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: AppbarGrad,
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight),
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: textWidget(
                          msg: "Book an Appointment",
                          txtColor: kWhite,
                          txtFontWeight: FontWeight.bold,
                          txtFontSize: h * 0.02),
                    ),
                  )
                ],
              ),
            ),
          )
              : Center(child: CircularProgressIndicator(color: kDarkBlue3,strokeWidth: 3,),)
      ),
    );
  }
}