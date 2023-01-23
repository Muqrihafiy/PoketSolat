import 'package:adhan/adhan.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';


final myCoordinates = Coordinates(3.139003, 101.686855);
// Replace with your own location lat, lng.
final params = CalculationMethod.karachi.getParameters();
final prayerTimes = PrayerTimes.today(myCoordinates, params);

class checkinlist with ChangeNotifier  {

  int subuh = 0;
  int zohor = 0;
  int asar = 0;
  int maghrib = 0 ;
  int isyak = 0;
  int latesubuh = 0;
  int latezohor = 0;
  int lateasar = 0;
  int latemaghrib = 0 ;
  int lateisyak = 0;
  int streak = 0;
  int siap = 0;
  int late = 0;
  bool sunnahsubuh = false;
  bool sunnahzohor = false;
  bool sunnahasar = false;
  bool sunnahmaghrib = false;
  bool sunnahisyak = false;
  bool checksubuh = false;
  bool checkzohor = false;
  bool checkasar = false;
  bool checkmaghrib = false;
  bool checkisyak = false;
  bool selesai = false;
  double health = 5;
  int jumlahsolat = 0;

  String savedDate = "not set";
  String currentDate = DateFormat('yyyy-MM-dd').format(DateTime.now());

  Future<void> saveDatenow() async {
      final prefs = await SharedPreferences.getInstance();
      savedDate = DateFormat('yyyy-MM-dd').format(DateTime.now());
      prefs.setString('savedDate', savedDate);
      print("---New save date is ($savedDate)---");
 }

  Future<void> overwriteSaveDate() async {
    final prefs = await SharedPreferences.getInstance();
    savedDate = currentDate;
    prefs.setString('savedDate', savedDate);
    print("---Today's Date has changed to ($currentDate)---");
  }

  Future<void> loaddate() async {
    final prefs = await SharedPreferences.getInstance();
    savedDate = prefs.getString('savedDate') ?? 'not set';

  }

  String checkDate()  {
    loaddate();
    return savedDate;

  }
  Future<void> dailyreset() async {
     SharedPreferences prefs = await SharedPreferences.getInstance();
     await prefs.remove('subuh');
     await prefs.remove('zohor');
     await prefs.remove('asar');
     await prefs.remove('maghrib');
     await prefs.remove('isyak');
     await prefs.remove('health');
     await prefs.remove('sunnahsubuh');
     await prefs.remove('sunnahzohor');
     await prefs.remove('sunnahasar');
     await prefs.remove('sunnahmaghrib');
     await prefs.remove('sunnahisyak');
     await prefs.remove('checksubuh');
     await prefs.remove('checkzohor');
     await prefs.remove('checkasar');
     await prefs.remove('checkmaghrib');
     await prefs.remove('checkisyak');
     await prefs.remove('checkselesai');
  }

  Future<void> subuhcheckin() async {
    final prefs = await SharedPreferences.getInstance();
    subuh = 1;
    prefs.setInt('subuh', subuh);
    notifyListeners();
  }

  Future<void> subuhlate() async {
    final prefs = await SharedPreferences.getInstance();
    subuh = 2;
    prefs.setInt('subuh', subuh);
    increaseLateCounter();
    increaseLateSubuh();
    notifyListeners();
  }

  Future<void> loadSubuh()  async {
    final prefs = await SharedPreferences.getInstance();
    subuh = (prefs.getInt('subuh') ?? 0);
    notifyListeners();
  }

  Future<int> getSubuh() async {
    await loadSubuh();
    return subuh;
  }

  Future <void> SunnahSubuhDone() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('sunnahsubuh', true);
  }

  Future<void> CheckSunnahSubuh() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    sunnahsubuh = prefs.getBool('sunnahsubuh') ?? false;
    notifyListeners();
  }
  bool getSunnahSubuh () {
    CheckSunnahSubuh();
    return sunnahsubuh;
  }

  Future<void> zohorcheckin() async {
    final prefs = await SharedPreferences.getInstance();
    zohor = 1;
    prefs.setInt('zohor', zohor);
    notifyListeners();
  }

  Future<void> zohorlate() async {
    final prefs = await SharedPreferences.getInstance();
    zohor = 2;
    prefs.setInt('zohor', zohor);
    increaseLateCounter();
    increaseLateZohor();
    notifyListeners();
  }

  Future<void> loadZohor()  async {
    final prefs = await SharedPreferences.getInstance();
    zohor = (prefs.getInt('zohor') ?? 0);
    notifyListeners();
  }

  Future<int> getZohor() async {
    await loadZohor();
    return zohor;
  }

  Future <void> SunnahZohorDone() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('sunnahzohor', true);
  }

  Future<void> CheckSunnahZohor() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    sunnahzohor = prefs.getBool('sunnahzohor') ?? false;
    notifyListeners();
  }
  bool getSunnahZohor () {
    CheckSunnahZohor();
    return sunnahzohor;
  }



  Future<void> asarcheckin() async {
    final prefs = await SharedPreferences.getInstance();
    asar = 1;
    prefs.setInt('asar', asar);
    notifyListeners();

  }

  Future<void> asarlate() async {
    final prefs = await SharedPreferences.getInstance();
    asar = 2;
    prefs.setInt('asar', asar);
    increaseLateCounter();
    increaseLateAsar();
    notifyListeners();
  }

  Future<void> loadAsar()  async {
    final prefs = await SharedPreferences.getInstance();
    asar = (prefs.getInt('asar') ?? 0);
    notifyListeners();
  }

  Future<int> getAsar() async {
    await loadAsar();
    return asar;
  }

  Future <void> SunnahAsarDone() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('sunnahasar', true);
  }

  Future<void> CheckSunnahAsar() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    sunnahasar = prefs.getBool('sunnahasar') ?? false;
    notifyListeners();
  }
  bool getSunnahAsar () {
    CheckSunnahAsar();
    return sunnahasar;
  }

  Future<void> maghribcheckin() async {
    final prefs = await SharedPreferences.getInstance();
    maghrib = 1;
    prefs.setInt('maghrib', maghrib);
    notifyListeners();
  }

  Future<void> maghriblate() async {
    final prefs = await SharedPreferences.getInstance();
    maghrib = 2;
    prefs.setInt('maghrib', maghrib);
    increaseLateCounter();
    increaseLateMaghrib();
    notifyListeners();
  }

  Future<void> loadMaghrib()  async {
    final prefs = await SharedPreferences.getInstance();
    maghrib = (prefs.getInt('maghrib') ?? 0);
    notifyListeners();
  }

  Future<int> getMaghrib() async{
    await loadMaghrib();
    return maghrib;
  }

  Future <void> SunnahMaghribDone() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('sunnahmaghrib', true);
  }

  Future<void> CheckSunnahMaghrib() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    sunnahmaghrib = prefs.getBool('sunnahmaghrib') ?? false;
    notifyListeners();
  }
  bool getSunnahMaghrib () {
    CheckSunnahMaghrib();
    return sunnahmaghrib;
  }

  Future<void> isyakcheckin() async {
    final prefs = await SharedPreferences.getInstance();
    isyak = 1;
    prefs.setInt('isyak', isyak);
    notifyListeners();
  }

  Future<void> isyaklate() async {
    final prefs = await SharedPreferences.getInstance();
    isyak = 2;
    prefs.setInt('isyak', isyak);
    increaseLateCounter();
    increaseLateIsyak();
    notifyListeners();
  }

  Future<void> loadIsyak()  async {
    final prefs = await SharedPreferences.getInstance();
    isyak = (prefs.getInt('isyak') ?? 0);
    notifyListeners();
  }

  Future<int>getIsyak() async {
    await loadIsyak();
    return isyak;
  }

  Future <void> SunnahIsyakDone() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('sunnahisyak', true);
  }

  Future<void> CheckSunnahIsyak() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    sunnahisyak = prefs.getBool('sunnahisyak') ?? false;
    notifyListeners();
  }
  bool getSunnahIsyak () {
    CheckSunnahIsyak();
    return sunnahisyak;
  }

  Future<void> increaseSiapCounter()  async {
    final prefs = await SharedPreferences.getInstance();
    siap = (prefs.getInt('siap') ?? 0) + 1;
    prefs.setInt('siap', siap);
    notifyListeners();
  }


  Future<void> loadSiap()  async {
    final prefs = await SharedPreferences.getInstance();
    siap = (prefs.getInt('siap') ?? 0);
    notifyListeners();
  }

    int getSiap()  {
     loadSiap();
    return siap;
  }

  Future<void> increaseLateCounter()  async {
    final prefs = await SharedPreferences.getInstance();
    late = (prefs.getInt('late') ?? 0) + 1;
    prefs.setInt('late', late);
    notifyListeners();
  }


  Future<void> loadLate()  async {
    final prefs = await SharedPreferences.getInstance();
    late = (prefs.getInt('late') ?? 0);
    notifyListeners();
  }

  int getLate() {
    loadLate();
    return late;
  }

  Future<void> increaseLateSubuh()  async {
    final prefs = await SharedPreferences.getInstance();
    latesubuh = (prefs.getInt('latesubuh') ?? 0) + 1;
    prefs.setInt('latesubuh', latesubuh);
    notifyListeners();
  }


  Future<void> loadLateSubuh()  async {
    final prefs = await SharedPreferences.getInstance();
    latesubuh = (prefs.getInt('latesubuh') ?? 0);
    notifyListeners();
  }

  int getLateSubuh() {
    loadLateSubuh();
    return latesubuh;
  }

  Future<void> increaseLateZohor()  async {
    final prefs = await SharedPreferences.getInstance();
    latezohor = (prefs.getInt('latezohor') ?? 0) + 1;
    prefs.setInt('latezohor', latezohor);
    notifyListeners();
  }


  Future<void> loadLateZohor()  async {
    final prefs = await SharedPreferences.getInstance();
    latezohor = (prefs.getInt('latezohor') ?? 0);
    notifyListeners();
  }

  int getLateZohor() {
    loadLateZohor();
    return latezohor;
  }

  Future<void> increaseLateAsar()  async {
    final prefs = await SharedPreferences.getInstance();
    lateasar = (prefs.getInt('lateasar') ?? 0) + 1;
    prefs.setInt('lateasar', lateasar);
    notifyListeners();
  }


  Future<void> loadLateAsar()  async {
    final prefs = await SharedPreferences.getInstance();
    lateasar = (prefs.getInt('lateasar') ?? 0);
    notifyListeners();
  }

  int getLateAsar() {
    loadLateAsar();
    return lateasar;
  }

  Future<void> increaseLateMaghrib()  async {
    final prefs = await SharedPreferences.getInstance();
    latemaghrib = (prefs.getInt('latemaghrib') ?? 0) + 1;
    prefs.setInt('latemaghrib', latemaghrib);
    notifyListeners();
  }


  Future<void> loadLateMaghrib()  async {
    final prefs = await SharedPreferences.getInstance();
    latemaghrib = (prefs.getInt('latemaghrib') ?? 0);
    notifyListeners();
  }

  int getLateMaghrib() {
    loadLateMaghrib();
    return latemaghrib;
  }

  Future<void> increaseLateIsyak()  async {
    final prefs = await SharedPreferences.getInstance();
    lateisyak = (prefs.getInt('lateisyak') ?? 0) + 1;
    prefs.setInt('lateisyak', lateisyak);
    notifyListeners();
  }


  Future<void> loadLateIsyak()  async {
    final prefs = await SharedPreferences.getInstance();
    lateisyak = (prefs.getInt('lateisyak') ?? 0);
    notifyListeners();
  }

  int getLateIsyak() {
    loadLateIsyak();
    return lateisyak;
  }

  Future<void> loadTotalSolat()  async {
    final prefs = await SharedPreferences.getInstance();
    jumlahsolat = (prefs.getInt('siap') ?? 0) + (prefs.getInt('late') ?? 0);
    prefs.setInt('jumlahsolat', jumlahsolat);
    jumlahsolat = (prefs.getInt('jumlahsolat') ?? 0);
    notifyListeners();
  }

  int getTotal() {
    loadTotalSolat();
    return jumlahsolat;
  }



  Future<void> loadhealth()  async {
    final prefs = await SharedPreferences.getInstance();
    health = (prefs.getDouble('health') ?? 5);
    notifyListeners();
  }

  Future<void> decreasehealth()  async {
    final prefs = await SharedPreferences.getInstance();
    if(getHealth() > 0) {
      health = (prefs.getDouble('health') ?? 5) - 1;
      prefs.setDouble('health', health);
    }
    else{
      health == 0;
      prefs.setDouble('health', health);
    }
    notifyListeners();
  }

  double getHealth() {
    loadhealth();
    return health;
  }


  Future<void> increaseStreak()  async {
    final prefs = await SharedPreferences.getInstance();
    streak = (prefs.getInt('streak') ?? 0) + 1;
    prefs.setInt('streak', streak);
    notifyListeners();
  }

  Future<void> resetStreak()  async {
    final prefs = await SharedPreferences.getInstance();
    streak = 0;
    prefs.setInt('streak', streak);
  }

  Future<void> loadStreak()  async {
    final prefs = await SharedPreferences.getInstance();
    streak = (prefs.getInt('streak') ?? 0);
  }

  int getStreak() {
    loadStreak();
    return streak;
  }



  Future <void> SubuhChecked() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('checksubuh', true);
  }

  Future<void> CheckSubuh() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    checksubuh = prefs.getBool('checksubuh') ?? false;
    notifyListeners();
  }
  Future <bool> getCheckSubuh () async{
    CheckSubuh();
    return checksubuh;
  }

  Future <void> ZohorChecked() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('checkzohor', true);
  }

  Future<void> CheckZohor() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    checkzohor = prefs.getBool('checkzohor') ?? false;
    notifyListeners();
  }
  Future <bool> getCheckZohor () async {
    CheckZohor();
    return checkzohor;
  }

  Future <void> AsarChecked() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('checkasar', true);
  }

  Future<void> CheckAsar() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    checkasar = prefs.getBool('checkasar') ?? false;
    notifyListeners();
  }
  Future <bool>getCheckAsar () async {
    CheckAsar();
    return checkasar;
  }

  Future <void> MaghribChecked() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('checkmaghrib', true);
  }

  Future<void> CheckMaghrib() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    checkmaghrib = prefs.getBool('checkmaghrib') ?? false;
    notifyListeners();
  }
  Future <bool> getCheckMaghrib () async {
    CheckMaghrib();
    return checkmaghrib;
  }

  Future <void> IsyakChecked() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('checkisyak', true);
  }

  Future<void> CheckIsyak() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    checkisyak = prefs.getBool('checkisyak') ?? false;
    notifyListeners();
  }
  Future <bool> getCheckIsyak () async {
    CheckIsyak();
    return checkisyak;
  }

  Future <void> hariSelesai() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('checkselesai', true);
  }

  Future<void> CheckhariSelesai() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    selesai = prefs.getBool('checkselesai') ?? false;
    notifyListeners();
  }
  Future <bool> getCheckSelesai() async {
    CheckhariSelesai();
    return selesai;
  }



  subuhlatevalue(){
    double valuesubuh = getLateSubuh() / getLate() * 100;
    return valuesubuh;
  }

  zohorlatevalue(){
    double valuezohor = getLateZohor() / getLate() * 100;
    return valuezohor;
  }
  asarlatevalue(){
    double valueasar = getLateAsar() / getLate() * 100;
    return valueasar;
  }
  maghriblatevalue(){
    double valuemaghrib = getLateMaghrib() / getLate() * 100;
    return valuemaghrib;
  }
  isyaklatevalue(){
    double valueisyak = getLateIsyak() / getLate() * 100;
    return valueisyak;
  }


}
