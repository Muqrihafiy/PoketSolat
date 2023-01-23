import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class nextWaktoButton extends StatelessWidget{
  const nextWaktoButton({
    Key? key,
    //required this.SubuhTime,
    // required this.SyurukTime,
    // required this.ZuhurTime,
    // required this.AsarTime,
    // required this.MaghribTime,
    // required this.IsyakTime,

    required this.nextwaktoTime,
    required this.nextwktoName,
    //

  }) : super(key: key);

  final String nextwaktoTime;
  final String nextwktoName;
  //final String SubuhTime;
  // final String SyurukTime;
  // final String ZuhurTime;
  // final String AsarTime;
  // final String MaghribTime;
  //final String IsyakTime;



  @override
  Widget build(BuildContext context) {
    return Container(
      // height: Get.width / 2,
      margin: EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 12,
      ),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: EdgeInsets.only(top: 20, bottom: 12),
            child: Column(
              children: [
                Container(
                  child:
                  Text(
                    "$nextwktoName at $nextwaktoTime",
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          // InkWell(
          //   onTap: () {showDialog(
          //           context: context,
          //           builder: (BuildContext context) {
          //           return AlertDialog(
          //           scrollable: true,
          //           title: Text("Waktu Solat hari ini"),
          //           content: Padding(
          //           padding: const EdgeInsets.all(8.0),
          //           child: Column(
          //           children: <Widget>[
          //            Row(
          //               children: [
          //                 Text("Subuh",
          //                   style: TextStyle(color: Color(0xFF000000),fontSize: 20),
          //                 ),
          //                 Text("$SubuhTime",
          //                   style: TextStyle(color: Color(0xFF1388be),fontSize: 20),
          //                 ),
          //               ],
          //           ),
          //             Row(
          //               children: [
          //                 Text("Syuruk",
          //                   style: TextStyle(color: Color(0xFF000000),fontSize: 20),
          //                 ),
          //                 Text("$SyurukTime",
          //                   style: TextStyle(color: Color(0xFF1388be),fontSize: 20),
          //                 ),
          //               ],
          //             ),
          //             Row(
          //               children: [
          //                 Text("Zohor",
          //                   style: TextStyle(color: Color(0xFF000000),fontSize: 20),
          //                 ),
          //                 Text("$ZuhurTime",
          //                   style: TextStyle(color: Color(0xFF1388be),fontSize: 20),
          //                 ),
          //               ],
          //             ),
          //             Row(
          //               children: [
          //                 Text("Asar",
          //                   style: TextStyle(color: Color(0xFF000000),fontSize: 20),
          //                 ),
          //                 Text("$AsarTime",
          //                   style: TextStyle(color: Color(0xFF1388be),fontSize: 20),
          //                 ),
          //               ],
          //             ),
          //             Row(
          //               children: [
          //                 Text("Maghrib",
          //                   style: TextStyle(color: Color(0xFF000000),fontSize: 20),
          //                 ),
          //                 Text("$MaghribTime",
          //                   style: TextStyle(color: Color(0xFF1388be),fontSize: 20),
          //                 ),
          //               ],
          //             ),
          //             Row(
          //               children: [
          //                 Text("Isyak",
          //                   style: TextStyle(color: Color(0xFF000000),fontSize: 20),
          //                 ),
          //                 Text("$IsyakTime",
          //                   style: TextStyle(color: Color(0xFF1388be),fontSize: 20),
          //                 ),
          //               ],
          //             ),
          //           ],
          //           ),
          //
          //           ),
          //
          //           );
          //           });
          //           },
          //   child: Container(
          //     margin: EdgeInsets.all(10),
          //     padding: EdgeInsets.all(10),
          //     alignment: Alignment.center,
          //     decoration: BoxDecoration(
          //         color: Colors.white,
          //         border: Border.all(
          //             color: Colors.grey, // Set border color
          //             width: 3.0),   // Set border width
          //         borderRadius: BorderRadius.all(
          //             Radius.circular(10.0)), // Set rounded corner radius
          //         boxShadow: [BoxShadow(blurRadius: 10,color: Colors.black,offset: Offset(1,3))] // Make rounded corner of border
          //     ),
          //     child: Text("Lihat waktu solat harini"),
          //   ),
          // )

        ],
      ),
    );
  }
}
