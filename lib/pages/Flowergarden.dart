
import 'package:adhan/adhan.dart';
import 'package:daily5/models/checkinlist.dart';
import 'package:daily5/provider/solatPointsProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'package:rive/rive.dart';



class FlowerGarden extends StatefulWidget{
  const FlowerGarden({Key? key,

}) : super(key: key);




  @override
  _SimpleFlowerGardenState createState() => _SimpleFlowerGardenState();
}
final myCoordinates = Coordinates(3.139003, 101.686855);
// Replace with your own location lat, lng.
final params = CalculationMethod.karachi.getParameters();
final prayerTimes = PrayerTimes.today(myCoordinates, params);

class _SimpleFlowerGardenState extends State<FlowerGarden>{


  SMITrigger? _SubuhEarly;
  SMITrigger? _SubuhLate;
  SMITrigger? _ZohorEarly;
  SMITrigger? _ZohorLate;
  SMITrigger? _AsarEarly;
  SMITrigger? _AsarLate;
  SMITrigger? _MaghribEarly;
  SMITrigger? _MaghribLate;
  SMITrigger? _IsyakEarly;
  SMITrigger? _IsyakLate;
  SMITrigger? _solatPerfect;
  SMITrigger? _solatImperfect;


  Artboard? _riveArtboard;

  String? message;

 

  @override
  void initState() {
    super.initState();

    // Load the animation file from the bundle, note that you could also
    // download this. The RiveFile just expects a list of bytes.
    rootBundle.load('android/assets/lotus.riv').then(
          (data) async {
        // Load the RiveFile from the binary data.
        final file = RiveFile.import(data);

        // The artboard is the root of the animation and gets drawn in the
        // Rive widget.
        final artboard = file.mainArtboard;
        var controller =
        StateMachineController.fromArtboard(artboard, 'State Machine ',onStateChange: _onStateChange);
        if (controller != null) {
          artboard.addController(controller);
          _SubuhEarly = controller.findInput<bool>('Subuh Early') as SMITrigger;
          _SubuhLate = controller.findInput<bool>('Subuh Late') as SMITrigger;
          _ZohorEarly = controller.findInput<bool>('Zohor Early') as SMITrigger;
          _ZohorLate = controller.findInput<bool>('Zohor late') as SMITrigger;
          _AsarEarly = controller.findInput<bool>('Asar Early') as SMITrigger;
          _AsarLate = controller.findInput<bool>('Asar Late') as SMITrigger;
          _MaghribEarly = controller.findInput<bool>('Maghrib early') as SMITrigger;
          _MaghribLate = controller.findInput<bool>('Maghrib late') as SMITrigger;
          _IsyakEarly = controller.findInput<bool>('Ishak early') as SMITrigger;
          _IsyakLate = controller.findInput<bool>('Ishak late') as SMITrigger;
          _solatPerfect = controller.findInput<bool>('Solat Perfect') as SMITrigger;
          _solatImperfect = controller.findInput<bool>('Solat Imperfect') as SMITrigger;
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

  void flowercheck() async {
    final provider = Provider.of<checkinlist>(context, listen: false);
    bool isyakchecked = await provider.getCheckIsyak();
    bool selesai = await provider.getCheckSelesai();
    int subuh = await provider.getSubuh() ;
    int zohor =await provider.getZohor() ;
    int asar =await provider.getAsar() ;
    int maghrib =await provider.getMaghrib() ;
    int isyak =await provider.getIsyak() ;
    if(isyakchecked == true){
      if (subuh == 2 || zohor ==2 || asar == 2 || maghrib==2 || isyak == 2) {
        _solatImperfect?.fire();
        if(selesai == false){
          await provider.hariSelesai();
          print('hari selesai');
          showDialog(context: context,
              builder: (BuildContext context)=>
                  AlertDialog(
                    title: const Text('Alamak!'),
                    content:  Text('Bunga anda telah tenggelam. Cuba lagi untuk tidak tinggal Solat esok!'),
                  ));
        }
      }

      else {
        _solatPerfect?.fire();
        if(selesai == false){
          Provider.of<solatPoints>(context, listen: false).increasePointFive();
          await provider.hariSelesai();
          print('hari selesai');
        }
        showDialog(context: context,
            builder: (BuildContext context)=>
                AlertDialog(
                  title: const Text('Tahniah!'),
                  content:  Text('Alhamdulillah, solat pada harini sempurna. Anda akan dapat tambahan 5 point'
                      'Teruskan usaha lagi!'),
                ));
      }
    }
  }

  void leafcheck()  async {
    final provider = Provider.of<checkinlist>(context, listen: false);
    int subuh = await provider.getSubuh() ;
    int zohor =await provider.getZohor() ;
    int asar =await provider.getAsar() ;
    int maghrib =await provider.getMaghrib() ;
    int isyak =await provider.getIsyak() ;

    switch(subuh){
      case 1:
        _SubuhEarly?.fire();
        break;
      case 2:
        _SubuhLate?.fire();

        break;
    }
    switch(zohor){
      case 1:
        _ZohorEarly?.fire();
        break;
      case 2:
        _ZohorLate?.fire();

        break;
    }
    switch(asar){
      case 1:
        _AsarEarly?.fire();
        break;
      case 2:
        _AsarLate?.fire();



        break;
    }
    switch(maghrib){
      case 1:
        _MaghribEarly?.fire();
        break;
      case 2:
        _MaghribLate?.fire();

        break;
    }
    switch(isyak){
      case 1:
        _IsyakEarly?.fire();
        break;
      case 2:
        _IsyakLate?.fire();

        break;
      default:
        break;
    }

  }
  @override
  Widget build(BuildContext context) {
    setState(() {
      leafcheck();
      flowercheck();
    });
    return Scaffold(
        backgroundColor: Colors.blueGrey[900],
      appBar: AppBar(

        backgroundColor: Colors.deepPurple[900],
        title: const Text('Bunga Solat'),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only( right: 10),
            child: IconButton(
              icon: const Icon(
                Icons.question_mark,),
              onPressed: () {
                showDialog(context: context,
                    builder: (BuildContext context)=>
                    AlertDialog(
                      title: const Text('INFO BUNGA SOLAT'),
                      content:  Text(' Setiap daun mewakili setiap Waktu Solat,'
                          'Jika anda solat pada masanya, daun akan bertukar hijau, Jika tidak ia akan bertukar merah.'
                          'Cuba dapatkan semua daun bewarna hijau untuk mendapat kejutan ;)'),
                    ));
            },
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

