import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vibration/vibration.dart';

import '../../models/bottomnavbar.dart';



class Tasbih extends StatefulWidget {
  @override
  _TasbihState createState() => _TasbihState();
}

class _TasbihState extends State<Tasbih> {
  final String kBeadsCount = 'beadsCount';
  final String kRoundCount = 'roundCount';
  final String kImagePath = 'imagePath';
  PageController _controller = PageController(
    viewportFraction: 0.1,
    initialPage: 5,
  );
  int _beadCounter = 0;
  int _roundCounter = 0;
  bool _canVibrate = true;
  bool _isDisposed = false;
  final CarouselController _buttonCarouselController = CarouselController();
  @override
  void initState() {
    super.initState();
    _loadSettings();
  }

  @override
  void dispose() {
    _isDisposed = true;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: GestureDetector(
        onTap: () {
          _clicked();
        },
        onVerticalDragStart: (details) {
          _clicked();
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Expanded(
                flex: 2,
                child: SafeArea(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: [
                          const SizedBox(width: 45),
                          IconButton(
                              tooltip: 'Homepage',
                              icon: const Icon(Icons.home),
                              onPressed: () {
                                Get.to(() => bottomnavbar());
                              }),
                          IconButton(
                              tooltip: 'Reset counter',
                              icon: const Icon(Icons.refresh),
                              onPressed: () {
                                _resetEveryThing();
                              }),
                        ],
                      ),
                      const Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        textDirection: TextDirection.ltr,
                        children: <Widget>[
                          _Counter(
                              counter: _roundCounter, counterName: 'Round'),
                          _Counter(
                              counter: _beadCounter, counterName: 'Beads'),
                        ],
                      ),
                      CarouselSlider(
                        carouselController: _buttonCarouselController,
                        options: CarouselOptions(
                          height: 100.0,
                          enlargeCenterPage: true,
                        ),
                        items: [1, 2, 3, 4].map((i) {
                          return Builder(
                            builder: (BuildContext context) {
                              return Container(
                                  width: MediaQuery.of(context).size.width,
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 5.0),
                                  decoration: BoxDecoration(

                                      borderRadius: BorderRadius.circular(12)),
                                  child: Image.asset('assets/images/zikr/$i.png'));
                            },
                          );
                        }).toList(),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          IconButton(
                              onPressed: () {
                                _buttonCarouselController.previousPage();
                              },
                              icon: const Icon(Icons.navigate_before)),
                          IconButton(
                              onPressed: () {
                                _buttonCarouselController.nextPage();
                              },
                              icon: const Icon(Icons.navigate_next)),
                        ],
                      ),
                      const Spacer()
                    ],
                  ),
                )),
            Expanded(
              flex: 1,
              child: Container(
                child: PageView.builder(
                  reverse: true,
                  physics: NeverScrollableScrollPhysics(),
                  controller: _controller,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, position) {
                    return  Image.asset(
                      'assets/images/beads/bead-2.png',
                    );

                  },
                  itemCount: null,
                ),
              ),
            ),
          ],
        ),

      ),
    );

  }

  void _loadSettings() async {
    bool? canVibrate = await Vibration.hasVibrator();
    if (!_isDisposed) {
      setState(() {
        _canVibrate = canVibrate!;
        _loadData();
      });
    }
  }

  void _loadData() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (!_isDisposed) {
      setState(() {
        _beadCounter = prefs.getInt(kBeadsCount) ?? 0;
        _roundCounter = prefs.getInt(kRoundCount) ?? 0;
      });
    }
  }

  Future<void> _resetEveryThing() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt(kBeadsCount, 0);
    prefs.setInt(kRoundCount, 0);
    prefs.setString(kImagePath, '');
    _loadData();
  }

  Future<void> _clicked() async {
    if (!_isDisposed) {
      setState(() {
        _beadCounter++;
        if (_beadCounter > 33) {
          _beadCounter = 0;
          _roundCounter++;
          if (_canVibrate) Vibration.vibrate(duration: 100, amplitude: 100);
        }
      });
    }
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt(kBeadsCount, _beadCounter);
    prefs.setInt(kRoundCount, _roundCounter);
    int nextPage = _controller.page!.round() + 1;
    _controller.animateToPage(nextPage,
        duration: Duration(milliseconds: 200), curve: Curves.easeIn);
  }


}

class _Counter extends StatelessWidget {
  _Counter(
      {Key? key,
        required this.counter,
        this.tsCounter = const TextStyle(
            color: Colors.black, fontSize: 50, fontWeight: FontWeight.bold),
        required this.counterName,
        this.tsCounterName = const TextStyle(
            color: Colors.black, fontSize: 20, fontStyle: FontStyle.italic)})
      : super(key: key);
  final int counter;
  final TextStyle tsCounter;
  final String counterName;
  final TextStyle tsCounterName;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text('$counter', style: tsCounter),
        Text('$counterName', style: tsCounterName)
      ],
    );
  }
}