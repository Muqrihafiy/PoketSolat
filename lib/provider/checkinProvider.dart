import 'package:adhan/adhan.dart';


final myCoordinates = Coordinates(3.139003, 101.686855);
// Replace with your own location lat, lng.
final params = CalculationMethod.karachi.getParameters();
final prayerTimes = PrayerTimes.today(myCoordinates, params);

class checkinCheck  {


  earlycalculation(){
    int a = prayerTimes.currentPrayer().index;
    int diffMin ;
    DateTime now = DateTime.now();
    String Non = 'No Prayers';
    String SubuhEarly = 'Subuh dengan Pantas';
    String SubuhLate = 'Subuh';
    String ZohorEarly = 'Zohor dengan Pantas';
    String ZohorLate = 'Zohor';
    String AsarEarly = 'Asar dengan Pantas';
    String AsarLate = 'Asar';
    String MaghirbEarly = 'Maghrib dengan Pantas';
    String MaghribLate = 'Maghrib';
    String IshakEarly = 'Ishak dengan Pantas';
    String IshakLate = 'Ishak';

    switch(a) {
      case 1 :
        DateTime prayernow = prayerTimes.fajr;
        DateTime dt1 = DateTime.parse("${now}");
        DateTime dt2 = DateTime.parse("${prayernow}");
        Duration diff = dt1.difference(dt2);
        diffMin = diff.inMinutes;
        if (diffMin <= 30 ) {

          return SubuhEarly;

        }
        else if (diffMin > 30 ){
          return SubuhLate;
        }
        break;
      case 2 :
        return Non;
      case 3 :
        DateTime prayernow = prayerTimes.dhuhr;
        DateTime dt1 = DateTime.parse("${now}");
        DateTime dt2 = DateTime.parse("${prayernow}");
        Duration diff = dt1.difference(dt2);
        diffMin = diff.inMinutes;
        if (diffMin <= 30 ) {
          return ZohorEarly ;
        }
        else if (diffMin > 30 ){
          return ZohorLate;
        }
        break;
      case 4 :
        DateTime prayernow = prayerTimes.asr;
        DateTime dt1 = DateTime.parse("${now}");
        DateTime dt2 = DateTime.parse("${prayernow}");
        Duration diff = dt1.difference(dt2);
        diffMin = diff.inMinutes;
        if (diffMin <= 30 ) {
          return AsarEarly;
        }
        else if (diffMin > 30 ){
          return AsarLate;
        }
        break;
      case 5 :
        DateTime prayernow = prayerTimes.maghrib;
        DateTime dt1 = DateTime.parse("${now}");
        DateTime dt2 = DateTime.parse("${prayernow}");
        Duration diff = dt1.difference(dt2);
        diffMin = diff.inMinutes;
        if (diffMin <= 30 ) {
          return MaghirbEarly;
        }
        else if (diffMin > 30 ){
          return MaghribLate;
        }
        break;
      case 6 :
        DateTime prayernow = prayerTimes.isha;
        DateTime dt1 = DateTime.parse("${now}");
        DateTime dt2 = DateTime.parse("${prayernow}");
        Duration diff = dt1.difference(dt2);
        diffMin = diff.inMinutes;
        if (diffMin <= 30 ) {
          return IshakEarly;
        }
        else if (diffMin > 30 ){
          return IshakLate;
        }
        break;
      default: return Non;

    }
  }


}