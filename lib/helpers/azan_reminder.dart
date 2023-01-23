
import 'package:adhan/adhan.dart';

class AzanWaktu{
  final bool isAzanOn;
  final String azanName;
  const AzanWaktu({
    this.azanName = "Omar & Hana  Azan  Istimewa Ramadan.mp3", this.isAzanOn = true});
}


class AzanReminders{
  AzanWaktu azanSubuh;
  AzanWaktu azanZohor;
  AzanWaktu azanAsar;
  AzanWaktu azanMaghrib;
  AzanWaktu azanIsyak;
  Coordinates coordinates;
  CalculationParameters params;
  AzanReminders({
    this.azanSubuh = const AzanWaktu(),
    this.azanZohor = const AzanWaktu(),
    this.azanAsar = const AzanWaktu(),
    this.azanMaghrib =const AzanWaktu(),
    this.azanIsyak  = const AzanWaktu(),
    required this.coordinates,
    required this.params
  });
  List<AzanReminder> azanReminders=[];

  Future<void>initialization() async {
    for(var i = 0; i<30; i++){
       final dateTime = DateComponents.from(DateTime.now().add(Duration(days: i)));
       PrayerTimes prayerTimes =
       PrayerTimes(coordinates, dateTime, params,);
      if(azanSubuh.isAzanOn){
        azanReminders.add(AzanReminder(
          id: 1 + 5 * i,azan:azanSubuh.azanName,time: prayerTimes.fajr,wkto:'Subuh'
        ));
        // print('Subuhisset');
      }
      if(azanZohor.isAzanOn){
        azanReminders.add(AzanReminder(
            id: 2 + 5 * i,azan:azanZohor.azanName,time: prayerTimes.dhuhr,wkto:'Zohor'
        ));
        // print('Zohorisset');
      }
      if(azanAsar.isAzanOn){
        azanReminders.add(AzanReminder(
            id: 3 + 5 * i,azan:azanAsar.azanName,time: prayerTimes.asr,wkto:'Asar'
        ));
        // print('Asarisset');
      }
      if(azanMaghrib.isAzanOn){
        azanReminders.add(AzanReminder(
            id: 4 + 5 * i,azan:azanMaghrib.azanName,time: prayerTimes.maghrib,wkto:'Maghrib'
        ));
      }
      if(azanIsyak.isAzanOn){
        azanReminders.add(AzanReminder(
            id: 5 + 5 * i,azan:azanIsyak.azanName,time: prayerTimes.isha,wkto:'Isyak'
        ));
        // print('Isyakisset');
      }
    }
  }
}


class AzanReminder{
   int id;
   String azan;
   String wkto;
   DateTime time;
   AzanReminder({required this.id,required this.azan,required this.wkto,required this.time});

}
