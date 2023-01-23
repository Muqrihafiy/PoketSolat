import 'package:adhan/adhan.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'package:rive/rive.dart';

import '../provider/solatPointsProvider.dart';



class PokokIlmu extends StatefulWidget{
  const PokokIlmu({Key? key,

  }) : super(key: key);




  @override
  PokokIlmuState createState() => PokokIlmuState();
}
final myCoordinates = Coordinates(3.139003, 101.686855);
// Replace with your own location lat, lng.
final params = CalculationMethod.karachi.getParameters();
final prayerTimes = PrayerTimes.today(myCoordinates, params);

class PokokIlmuState extends State<PokokIlmu>{


  Artboard? _riveArtboard;
  SMIInput<double>? _numberExampleInput;
  String? message;



  @override
  void initState() {
    super.initState();

    // Load the animation file from the bundle, note that you could also
    // download this. The RiveFile just expects a list of bytes.
    rootBundle.load('android/assets/pokokilmu.riv').then(
          (data) async {
        // Load the RiveFile from the binary data.
        final file = RiveFile.import(data);

        // The artboard is the root of the animation and gets drawn in the
        // Rive widget.
        final artboard = file.mainArtboard;
        var controller =
        StateMachineController.fromArtboard(artboard, 'ScrollingBehavior',onStateChange: _onStateChange);
        if (controller != null) {
          artboard.addController(controller);
          _numberExampleInput = controller.findInput<double>('scrollPct') as SMINumber;
        }
        setState(() => _riveArtboard = artboard);
      },
    );
  }

  void _onStateChange(
      String stateMachineName,
      String stateName,
      ) =>
      setState(
            () => print('State Changed in $stateMachineName to $stateName') ,
      );


  @override
  Widget build(BuildContext context) {
    setState(() {
      _numberExampleInput?.value = Provider.of<solatPoints>(context, listen: false).getCounterPokok();
    });
    return Scaffold(
        backgroundColor: Colors.blueGrey[900],
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.blueGrey[900],
          elevation: 0.0,
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 15, bottom: 10, right: 10),
              child: Text('Lvl:${Provider.of<solatPoints>(context, listen: false).getCounterPokok()}',
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 25, color: Colors.white)
              ),
            ),
          ],
        ),
        body: Center(
          child: GestureDetector(
            child: _riveArtboard == null
                ? const SizedBox()
                : Stack(
                children: [
                  Positioned.fill(
                    child: Rive(
                      artboard: _riveArtboard!,

                    ),
                  ),
                ]
            ),
          ),
        )
    );
  }
}