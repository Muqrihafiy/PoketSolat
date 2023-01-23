import 'package:adhan/adhan.dart';


final myCoordinates = Coordinates(3.139003, 101.686855);
// Replace with your own location lat, lng.
final params = CalculationMethod.karachi.getParameters();
final prayerTimes = PrayerTimes.today(myCoordinates, params);

class bacaansolat {

 niatsolatarab(){
   if  (prayerTimes.currentPrayer().index == 1) {
    return "اُصَلِّى فَرْضَ الصُّبْحِ رَكْعَتَيْنِ اَدَاءً ِللهِ تَعَالَى";
   }
   else if (prayerTimes.currentPrayer().index == 2) {
     return "مَنْ صَلَّى الضُّحَى ثِنْتَيْ عَشْرَةَ رَكْعَةً بَنَى اللَّهُ لَهُ قَصْرًا مِنْ ذَهَبٍ فِي الجَنَّةِ";
   }
   else if (prayerTimes.currentPrayer().index == 3) {
    return "اُصَلِّى فَرْضَ الظُّهْرِاَرْبَعَ رَكَعَاتٍِ اَدَاءً ِللهِ تَعَالَى";
   }
   else if (prayerTimes.currentPrayer().index == 4) {
     return "اُصَلِّى فَرْضَ الْعَصْرِاَرْبَعَ رَكَعَاتٍ اَدَاءً ِللهِ تَعَالَى";
   }
   else if (prayerTimes.currentPrayer().index == 5) {
     return "اُصَلِّى فَرْضَ الْمَغْرِبِ ثَلاَثَ رَكَعَاتٍ اَدَاءً ِللهِ تَعَالَى";
   }
   else if (prayerTimes.currentPrayer().index == 6){
     return "اُصَلِّى فَرْضَ الْعِشَاءِ اَرْبَعَ رَكَعَاتٍِ اَدَاءً ِللهِ تَعَالَى";
   }
   else {
     return "أُصَلِّي سُنَّةَ التَهَجُّدِ رَكعَتَينِ للهِ  تَعَالَي";
   }
 }
 niatsolatlatin(){
   if  (prayerTimes.currentPrayer().index == 1) {
     return "Usolli fardhosh shubhi rok'ataini adaa-an lillaahi ta'aala";
   }
   else if (prayerTimes.currentPrayer().index == 2) {
     return "Barangsiapa yang solat dhuha sebanyak 12 rakaat, maka Allah akan membina baginya sebuah istana daripada emas di syurga.";
   }
   else if (prayerTimes.currentPrayer().index == 3) {
     return "Usolli fardhodl dhuhri arba'a raka'aatin adaa-an lillaahi ta'aala";
   }
   else if (prayerTimes.currentPrayer().index == 4) {
     return "Usolli fardhol 'asri arba'a raka'aatin adaa-an lillaahi ta'aala";
   }
   else if (prayerTimes.currentPrayer().index == 5) {
     return "Usolli fardhol maghribi tsalaata raka'aatin adaa-an lillaahi ta'aala";
   }
   else if (prayerTimes.currentPrayer().index == 6){
     return "Usolli fardhol 'isyaa-i arba'a raka'aatin adaa-an lillaahi ta'aala";
   }
   else {
     return "Usolli sunnatat tahajjudi rak’ataini Lillahi ta’ala";
   }
 }
 niatsolatterjemahan(){
   if  (prayerTimes.currentPrayer().index == 1) {
     return "Aku berniat solat fardhu Subuh dua raka'at tunai kerana Allah Ta'ala";
   }
   else if (prayerTimes.currentPrayer().index == 2) {
     return "[Riwayat al-Tirmizi (473) dan Ibn Majah (1380)]";
   }
   else if (prayerTimes.currentPrayer().index == 3) {
     return "Aku berniat solat fardhu Zohor empat raka'at tunai kerana Allah Ta'ala";
   }
   else if (prayerTimes.currentPrayer().index == 4) {
     return "Aku berniat solat fardhu Asar empat raka'at tunai kerana Allah Ta'ala";
   }
   else if (prayerTimes.currentPrayer().index == 5) {
     return "Aku berniat solat fardhu Maghrib tiga raka'at tunai kerana Allah Ta'ala";
   }
   else if (prayerTimes.currentPrayer().index == 6){
     return "Aku berniat solat fardhu Isyak empat raka'at tunai kerana Allah Ta'ala";
   }
   else {
     return "Sahaja aku solat sunat tahajjud dua rakaat kerana Allah Taala";
   }
 }
}