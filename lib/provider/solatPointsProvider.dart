import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class solatPoints with ChangeNotifier {

  int points =  0;
  double pokok = 1;
  bool question1Bought = false;
  bool question1answered = false;
  bool question2Bought = false;
  bool question2answered = false;
  bool tasbihBought = false;

  Future<void> loadCounter()  async {
    final prefs = await SharedPreferences.getInstance();
      points = (prefs.getInt('counter') ?? 0);
      notifyListeners();
  }
  Future<void> increasePoint()  async {
    final prefs = await SharedPreferences.getInstance();
      points = (prefs.getInt('counter') ?? 0) + 1;
      prefs.setInt('counter', points);
    notifyListeners();
  }

  Future<void> increasePointDouble()  async {
    final prefs = await SharedPreferences.getInstance();
    points = (prefs.getInt('counter') ?? 0) + 2;
    prefs.setInt('counter', points);
    notifyListeners();
  }
  Future<void> increasePointFive()  async {
    final prefs = await SharedPreferences.getInstance();
    points = (prefs.getInt('counter') ?? 0) + 5;
    prefs.setInt('counter', points);
    notifyListeners();
  }

  Future<void> decreasePoint5()  async {
    final prefs = await SharedPreferences.getInstance();
    points = (prefs.getInt('counter') ?? 0) - 5;
    prefs.setInt('counter', points);
    notifyListeners();
  }

  Future<void> decreasePoint20()  async {
    final prefs = await SharedPreferences.getInstance();
    points = (prefs.getInt('counter') ?? 0) - 20;
    prefs.setInt('counter', points);
    notifyListeners();
  }

  Future<void> decreasePoint30()  async {
    final prefs = await SharedPreferences.getInstance();
    points = (prefs.getInt('counter') ?? 0) - 30;
    prefs.setInt('counter', points);
    notifyListeners();
  }

  int getCounter() {
    loadCounter();
    return points;
  }

  Future<void> loadCounterPokok()  async {
    final prefs = await SharedPreferences.getInstance();
    pokok = (prefs.getDouble('pokok') ?? 1);
    notifyListeners();
  }
  Future<void> increasePointPokok()  async {
    final prefs = await SharedPreferences.getInstance();
    pokok = (prefs.getDouble('pokok') ?? 1) + 2;
    prefs.setDouble('pokok', pokok);
    notifyListeners();
  }
  Future<void> HalfPointPokok()  async {
    final prefs = await SharedPreferences.getInstance();
    pokok = (prefs.getDouble('pokok') ?? 1) + 5;
    prefs.setDouble('pokok', pokok);
    notifyListeners();
  }

  Future<void> FullpointPokok()  async {
    final prefs = await SharedPreferences.getInstance();
    pokok = (prefs.getDouble('pokok') ?? 1) + 10;
    prefs.setDouble('pokok', pokok);
    notifyListeners();
  }

  double getCounterPokok() {
    loadCounterPokok();
    return pokok;
  }


  Future <void> Question1Bought() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('question1Bought', true);
  }

  Future<void> CheckQuestion1Bought() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    question1Bought = prefs.getBool('question1Bought') ?? false;
    notifyListeners();
  }
  Future <bool> getCheckQ1 () async {
    CheckQuestion1Bought();
    return question1Bought;
  }

  Future <void> Question1answered() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('question1ans', true);
  }

  Future<void> CheckQuestion1answered() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    question1answered = prefs.getBool('question1ans') ?? false;
    notifyListeners();
  }
  bool getCheckQ1ans () {
    CheckQuestion1answered();
    return question1answered;
  }

  Future <void> Question2Bought() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('question2Bought', true);
  }

  Future<void> CheckQuestion2Bought() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    question2Bought = prefs.getBool('question2Bought') ?? false;
    notifyListeners();
  }
  Future <bool> getCheckQ2 () async {
    CheckQuestion2Bought();
    return question2Bought;
  }

  Future <void> Question2answered() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('question2ans', true);
  }

  Future<void> CheckQuestion2answered() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    question2answered = prefs.getBool('question2ans') ?? false;
    notifyListeners();
  }
  bool getCheckQ2ans () {
    CheckQuestion2answered();
    return question2answered;
  }

  Future <void> TasbihBought() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('tasbihbought', true);
  }

  Future<void> CheckTasbihBought() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    tasbihBought = prefs.getBool('tasbihbought') ?? false;
    notifyListeners();
  }
  Future <bool> getCheckTasbih () async {
    CheckTasbihBought() ;
    return tasbihBought;
  }
}
