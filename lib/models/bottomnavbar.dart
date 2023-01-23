
import 'package:adhan/adhan.dart';
import 'package:daily5/helpers/azan_reminder.dart';
import 'package:daily5/pages/Flowergarden.dart';
import 'package:daily5/pages/activityHome.dart';
import 'package:daily5/pages/surahdandoa.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../helpers/Notifications.dart';
import '../pages/mainmenu.dart';
import '../pages/profilepage.dart';
import 'checkinlist.dart';

class bottomnavbar extends StatefulWidget {
  const bottomnavbar ({Key? key}) : super(key: key);

  @override
  _bottomnavbarState createState() => _bottomnavbarState();
}

class _bottomnavbarState extends State<bottomnavbar> {
  double screenHeight = 0;
  double screenWidth = 0;
  String currentDate = DateFormat('yyyy-MM-dd').format(DateTime.now());
  bool isAzanGenerated = false;
  Color primary = const Color(0xffeef444c);

  int currentIndex = 0;
  late  PrayerTimes prayerTimes;
  final date = DateComponents.from(DateTime.now());
  final myCoordinates = Coordinates(3.139003, 101.686855);
  // Replace with your own location lat, lng.
  final params = CalculationMethod.karachi.getParameters();

  List<IconData> navigationIcons = [
    FontAwesomeIcons.personPraying,
    FontAwesomeIcons.bookQuran,
    FontAwesomeIcons.leaf,
    FontAwesomeIcons.dice,
    FontAwesomeIcons.person,
  ];

  @override
  void initState() {

    super.initState();
   isAzanGenerated = false;

  }

  void notificationSet() async {
    if (!isAzanGenerated) {
      AzanReminders azanReminders = AzanReminders(
        coordinates: myCoordinates,
        params: params,
        azanSubuh: AzanWaktu(isAzanOn: true),
        azanZohor: AzanWaktu(isAzanOn: true),
        azanAsar: AzanWaktu(
            isAzanOn: true, azanName: ""),
        azanMaghrib: AzanWaktu(
            isAzanOn: true, azanName: ""),
        azanIsyak: AzanWaktu(isAzanOn: true),
      );
      azanReminders.initialization();
      Notifications notifications = Notifications();
      notifications.initialize(context);
      notifications.cancelNotification();
      print('notificationset');
      for (var azanReminder in azanReminders.azanReminders) {
        notifications.setNotification(
            time: azanReminder.time,
            id: azanReminder.id,
            wkto: azanReminder.wkto,
            azan: azanReminder.azan);
        isAzanGenerated = true;

      }

    }
  }

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    print("Current save date is ${Provider.of<checkinlist>(context, listen: false).checkDate()}");
    if( Provider.of<checkinlist>(context, listen: false).checkDate() == 'not set'){
      Provider.of<checkinlist>(context, listen: false).saveDatenow();

    }
    else if (Provider.of<checkinlist>(context, listen: false).checkDate() != currentDate ){
      Provider.of<checkinlist>(context, listen: false).overwriteSaveDate();
      Provider.of<checkinlist>(context, listen: false).dailyreset();
    }
    else if (Provider.of<checkinlist>(context, listen: false).checkDate() == currentDate ){

    }
     setState(() {
       notificationSet();
     });

    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      body: IndexedStack(
        index: currentIndex,
        children: const [
           mainmenu(),
          BacaanSolat(),
          FlowerGarden(),
           ActivityHome(),
           ProfilePage(),
        ],
      ),

      bottomNavigationBar: Container(

        height: 70,
        margin: const EdgeInsets.only(
          left: 12,
          right: 12,
          bottom: 24,
        ),
        decoration: const BoxDecoration(
          color: Colors.lime,
          borderRadius: BorderRadius.all(Radius.circular(40)),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10,
              offset: Offset(2, 2),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(40)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for(int i = 0; i < navigationIcons.length; i++)...<Expanded>{
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        currentIndex = i;
                        if (currentIndex == 2){
                          Navigator.push(
                              context, MaterialPageRoute(builder: (context) => const FlowerGarden())
                          );
                        }
                      });
                    },
                    child: Container(
                      height: screenHeight,
                      width: screenWidth,
                      color: Colors.deepPurple[900],
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              navigationIcons[i],
                              color: i == currentIndex ? primary : Colors.white60,
                              size: i == currentIndex ? 30 : 26,
                            ),
                            i == currentIndex ? Container(
                              margin: const EdgeInsets.only(top: 6),
                              height: 3,
                              width: 22,
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.all(Radius.circular(40)),
                                color: primary,
                              ),
                            ) : const SizedBox(),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              }
            ],
          ),
        ),
      ),
    );
  }
}


