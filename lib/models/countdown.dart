import 'package:flutter/material.dart';
import 'package:adhan/adhan.dart';

class countdown extends  StatefulWidget {
  const countdown({Key? key}) : super(key: key);

  @override
  State<countdown> createState() => _countdownState();
}

class _countdownState extends State<countdown> {

  late  PrayerTimes prayerTimes;
  final date = DateComponents.from(DateTime.now());
  final myCoordinates = Coordinates(3.139003, 101.686855);
  // Replace with your own location lat, lng.
  final params = CalculationMethod.karachi.getParameters();

  @override
  void initState(){
    prayerTimes = PrayerTimes.today(myCoordinates, params);
    super.initState();
  }
  secondToHour(int seconds) {
    int minutes = seconds ~/60;
    int hours = minutes ~/60;
    seconds = seconds - minutes *60;
    minutes = minutes - hours *60;
    return "$hours Jam :$minutes Min :$seconds Saat";
  }

  @override
  Widget build(BuildContext context) {



    diffTime() async* {
      yield* Stream.periodic(const Duration(seconds: 1),(t){
        DateTime now = DateTime.now();
        if  (prayerTimes.currentPrayer().index == 1) {
          DateTime nextPrayertime = prayerTimes.sunrise;
          DateTime dt1 = DateTime.parse("$nextPrayertime");
          DateTime dt2 = DateTime.parse("$now");
          Duration diff = dt1.difference(dt2);
          return secondToHour(diff.inSeconds);
        }
        else if (prayerTimes.currentPrayer().index == 3) {
          DateTime nextPrayertime = prayerTimes.asr;
          DateTime dt1 = DateTime.parse("$nextPrayertime");
          DateTime dt2 = DateTime.parse("$now");
          Duration diff = dt1.difference(dt2);
          return secondToHour(diff.inSeconds);
        }
        else if (prayerTimes.currentPrayer().index == 4) {
          DateTime nextPrayertime = prayerTimes.maghrib;
          DateTime dt1 = DateTime.parse("$nextPrayertime");
          DateTime dt2 = DateTime.parse("$now");
          Duration diff = dt1.difference(dt2);
          return secondToHour(diff.inSeconds);
        }
        else if (prayerTimes.currentPrayer().index == 5) {
          DateTime nextPrayertime = prayerTimes.isha;
          DateTime dt1 = DateTime.parse("$nextPrayertime");
          DateTime dt2 = DateTime.parse("$now");
          Duration diff = dt1.difference(dt2);
          return secondToHour(diff.inSeconds);
        }
        else if (prayerTimes.currentPrayer().index == 6){
          return "Solat Terakhir hari ini";
        }
        else {
          return "Tunggu solat seterusnya";
        }
      });
    }



    return Container(
        child:
        StreamBuilder(
            stream: diffTime(),
            builder: (context, snapshot) {

              return Text("${snapshot.data}",
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              );

              // Text("DT1:" + dt1.toString()),
              // Text("DT2:" + dt2.toString()),

              // Text("Difference in Days: " + diff.inDays.toString()),
              // Text("Difference in Hours: " + diff.inHours.toString()),
              // Text("Difference in Minutes: " + diff.inMinutes.toString()),



            }
        )

    );

  }
}
