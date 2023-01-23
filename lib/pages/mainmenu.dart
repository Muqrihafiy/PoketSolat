import 'dart:async';

import 'package:adhan/adhan.dart';
import 'package:daily5/models/Streakwidget.dart';
import 'package:daily5/models/niatsolatwidget.dart';
import 'package:daily5/pages/sunnah.dart';
import 'package:daily5/provider/solatPointsProvider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../models/WaktuWidget.dart';
import '../models/checkinlist.dart';
import '../models/nextWaktoWidget.dart';


class mainmenu extends StatefulWidget {
  const mainmenu({Key? key}) : super(key: key);


  @override
  State<mainmenu> createState() => _mainmenuState();
}
List months = [
  "Jan",
  "Feb",
  "Mar",
  "Apr",
  "May",
  "Jun",
  "Jul",
  "Aug",
  "Sep",
  "Oct",
  "Nov",
  "Dec"
];

class _mainmenuState extends State<mainmenu> {

  late  PrayerTimes prayerTimes;
  final date = DateComponents.from(DateTime.now());
  final myCoordinates = Coordinates(3.139003, 101.686855);
 // Replace with your own location lat, lng.
  final params = CalculationMethod.karachi.getParameters();



  @override
  void initState(){
    prayerTimes = PrayerTimes.today(myCoordinates, params);
    super.initState();
    const fiveSec = const Duration(seconds: 5);
    new Timer.periodic(fiveSec, (Timer t) {
      prayerTimes = PrayerTimes.today(myCoordinates, params);
      ;
    });
  }



  var prayTimes = [
    PrayerTimeWrapper(name: 'Imsak', reminderAble: false),
    PrayerTimeWrapper(name: 'Subuh', reminderAble: true),
    PrayerTimeWrapper(name: 'Dhuha', reminderAble: true),
    PrayerTimeWrapper(name: 'Zuhur', reminderAble: true),
    PrayerTimeWrapper(name: 'Asar', reminderAble: true),
    PrayerTimeWrapper(name: 'Maghrib', reminderAble: true),
    PrayerTimeWrapper(name: 'Isyak', reminderAble: true),
  ];

  void latecheck() async {
    final provider = Provider.of<checkinlist>(context, listen: false);
    int subuh = await provider.getSubuh() ;
    int zohor =await provider.getZohor() ;
    int asar =await provider.getAsar() ;
    int maghrib =await provider.getMaghrib() ;
    int isyak =await provider.getIsyak() ;
    bool checksubuh = await provider.getCheckSubuh();
    bool checkzohor = await provider.getCheckZohor();
    bool checkasar = await provider.getCheckAsar();
    bool checkmaghrib = await provider.getCheckMaghrib();
    bool checkisyak =await provider.getCheckIsyak();

    switch(subuh){
      case 0:
        if (prayerTimes.currentPrayer().index >= 2 ) {
          if (checksubuh == false) {
           setState(() {
             Provider.of<checkinlist>(context, listen: false).SubuhChecked();
             Provider.of<checkinlist>(context, listen: false).decreasehealth();
             Provider.of<checkinlist>(context, listen: false).subuhlate();
           });
          }
        }
        break;
    }
    switch(zohor){
      case 0:
        if (prayerTimes.currentPrayer().index >= 4  ) {
          if (checkzohor == false ) {
            setState(() {
              Provider.of<checkinlist>(context, listen: false).zohorlate();
              Provider.of<checkinlist>(context, listen: false).decreasehealth();
              Provider.of<checkinlist>(context, listen: false).ZohorChecked();
            });
          }
        }
        break;
        }
    switch(asar){
      case 0:
        if (prayerTimes.currentPrayer().index >= 5 ) {
          if (checkasar == false ) {
            setState(() {
              Provider.of<checkinlist>(context, listen: false).asarlate();
              Provider.of<checkinlist>(context, listen: false).decreasehealth();
              Provider.of<checkinlist>(context, listen: false).AsarChecked();
            });
          }
        }
        break;
    }
    switch(maghrib){
      case 0:
        if (prayerTimes.currentPrayer().index >= 6  ) {
          if (checkmaghrib == false) {
            setState(() {
              Provider.of<checkinlist>(context, listen: false).maghriblate();
              Provider.of<checkinlist>(context, listen: false).decreasehealth();
              Provider.of<checkinlist>(context, listen: false).MaghribChecked();
            });
          }
        }
        break;
    }
    switch(isyak){
      case 0:
        if (DateTime.now().hour >= 23  ) {
          if (checkisyak == false) {
            setState(() {
              Provider.of<checkinlist>(context, listen: false).isyaklate();
              Provider.of<checkinlist>(context, listen: false).decreasehealth();
              Provider.of<checkinlist>(context, listen: false).IsyakChecked();

            });
          }
        }
        break;

      default:
        break;
    }

  }
  @override
  Widget build(BuildContext context) {
    setState(() {
      latecheck();
    });

    return Consumer<solatPoints>(
        builder: (context, solatpoints, child)
    {
      return Scaffold(
          backgroundColor: Colors.blueGrey[900],

          appBar: AppBar(
            automaticallyImplyLeading: false,
            leading: GestureDetector(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => const Sunnah())
                );
              },
              child: Icon(
                FontAwesomeIcons.ussunnah,
                size: 45,
              ),

            ),
            backgroundColor: Colors.deepPurple[900],
            elevation: 0.0,
            actions: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 15, bottom: 10, right: 10),
                child: Text('Pts:${solatpoints.getCounter()}',
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 25, color: Colors.white)
                ),
              ),
            ],
          ),
          body:
          Stack(
            children: [
              SingleChildScrollView(
                child:Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    StreakWidget(),
                    WaktoButton(
                      waktoTime: '8.04 pm',
                      wktoName: prayTimes[prayerTimes
                          .currentPrayer()
                          .index].name,

                    ),
                    NiatWaktu(),
                    const Padding(
                      padding: EdgeInsets.only(top: 10, bottom: 5),
                      child: Text('Solat Selepas Ini',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white)
                      ),
                    ),
                    Column(
                      children: [
                        if (prayerTimes
                        .currentPrayer()
                        .index == 0) ...[
                            nextWaktoButton(
                            nextwaktoTime: DateFormat.jm().format(
                            prayerTimes.fajr.toLocal()),
                            nextwktoName: prayTimes[prayerTimes
                                .nextPrayer()
                                .index].name,
                            ),]
                        else if (prayerTimes
                            .currentPrayer()
                            .index == 1) ...[
                          nextWaktoButton(
                            nextwaktoTime: DateFormat.jm().format(
                                prayerTimes.dhuhr.toLocal()),
                            nextwktoName: prayTimes[prayerTimes
                                .nextPrayer()
                                .index].name,
                          ),
                        ] else
                          if(prayerTimes
                              .currentPrayer()
                              .index == 2)...[
                            nextWaktoButton(
                              nextwaktoTime: DateFormat.jm().format(
                                  prayerTimes.dhuhr.toLocal()),
                              nextwktoName: prayTimes[prayerTimes
                                  .nextPrayer()
                                  .index].name,
                            ),
                          ] else
                            if(prayerTimes
                                .currentPrayer()
                                .index == 3)...[
                              nextWaktoButton(
                                nextwaktoTime: DateFormat.jm().format(prayerTimes
                                    .asr.toLocal()),
                                nextwktoName: prayTimes[prayerTimes
                                    .nextPrayer()
                                    .index].name,
                              ),
                            ] else
                              if(prayerTimes
                                  .currentPrayer()
                                  .index == 4)...[
                                nextWaktoButton(
                                  nextwaktoTime: DateFormat.jm().format(
                                      prayerTimes.maghrib.toLocal()),
                                  nextwktoName: prayTimes[prayerTimes
                                      .nextPrayer()
                                      .index].name,
                                ),
                              ] else
                                if(prayerTimes
                                    .currentPrayer()
                                    .index == 5)...[
                                  nextWaktoButton(
                                    nextwaktoTime: DateFormat.jm().format(
                                        prayerTimes.isha.toLocal()),
                                    nextwktoName: prayTimes[prayerTimes
                                        .nextPrayer()
                                        .index].name,
                                  ),
                                ] else
                                  if (prayerTimes
                                      .currentPrayer()
                                      .index == 6)...[
                                    nextWaktoButton(
                                      nextwaktoTime: DateFormat.jm().format(
                                          prayerTimes.fajr),
                                      nextwktoName: "Subuh",

                                    ),
                                  ]
                      ],
                    ),
                  ],
                ),
              )
            ],
          )
      );
    }
    );
  }

  // void  getUserPoints() async {
  //   final SharedPreferences pref = await SharedPreferences.getInstance();
  //   solatpoint = pref.getInt('pointdata');
  // }
}
class PrayerTimeWrapper {
  final String name;
  final bool reminderAble;

  PrayerTimeWrapper({required this.name, required this.reminderAble});
}