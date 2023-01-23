
import 'package:adhan/adhan.dart';
import 'package:daily5/models/checkinlist.dart';
import 'package:daily5/provider/checkinProvider.dart';
import 'package:daily5/provider/solatPointsProvider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';



class WaktoButton extends StatefulWidget{
  const WaktoButton({
    Key? key,

    required this.waktoTime,
    required this.wktoName,


  }) : super(key: key);

  final String waktoTime;
  final String wktoName;




  @override
  State<WaktoButton> createState() => _WaktoButtonState();
}


class _WaktoButtonState extends State<WaktoButton> {
  bool enableBorder = false;
  late PrayerTimes prayerTimes = PrayerTimes.today(myCoordinates, params);
  final date = DateComponents.from(DateTime.now());
  final myCoordinates = Coordinates(3.139003, 101.686855);
// Replace with your own location lat, lng.
  final params = CalculationMethod.karachi.getParameters();

  void isyakChecked(){
    final provider = Provider.of<checkinlist>(context, listen: false);
    provider.IsyakChecked();
  }

  void streakCalculator() async {
    final provider = Provider.of<checkinlist>(context, listen: false);
    int solat = prayerTimes.currentPrayer().index;
    int subuh = await provider.getSubuh();
    int zohor = await provider.getZohor();
    int asar = await provider.getAsar();
    int maghrib = await provider.getMaghrib();
    int isyak = await provider.getIsyak();
    switch(solat){
      case 1:
        if ( subuh ==1 && isyak==1 ){
          provider.increaseStreak();
        }
        else if (isyak==2 && subuh !=2 ){
          await provider.resetStreak();
        }
        break;
      case 3:
        if ( zohor==1 && subuh==1 ){
          provider.increaseStreak();
        }
        else if (subuh==2 && zohor!=2 ){
          await provider.resetStreak();
        }
        break;
      case 4:
        if ( asar==1 && zohor==1 ){
          provider.increaseStreak();
        }
        else if (zohor==2 && asar!=2 ){
          await provider.resetStreak();
        }
        break;
      case 5:
        if ( maghrib==1 && asar==1 ){
          provider.increaseStreak();
        }
        else if (asar==0 && maghrib!=2 ){
          await provider.resetStreak();
        }
        break;
      case 6:
        if ( isyak==1 && maghrib==1 ){
          provider.increaseStreak();
        }
        else if (maghrib==0 && isyak!=2 ){
         await  provider.resetStreak();
        }
        break;
    }
  }


  @override
  void initState() {
    prayerTimes = PrayerTimes.today(myCoordinates, params);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: Get.width / 2,
      margin: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 3,
      ),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Container(
                margin: const EdgeInsets.only(right: 8),
                child: const Icon(
                  Icons.place,
                  color: Colors.white,
                  size: 14,
                ),
              ),
              const Expanded(
                child: Text(
                  "Wilayah Persekutuan,KL",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Text(
                DateFormat("dd MMM yyyy")
                    .format(DateTime.now()),
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.right,
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.only(top: 20, bottom: 12),
            child: Column(
              children: [
                const Text(
                  "Waktu Sekarang",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),
                  Text(
                    widget.wktoName,
                    style: const TextStyle(
                      fontSize: 32,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

              ],
            ),
          ),
           InkWell(
              onTap: () async {
                setState(()  {
                  // set current index!
                enableBorder = !enableBorder;

                showDialog(context: context,
                    builder: (BuildContext context)=>
                        AlertDialog(
                          title: const Text('Selesai Solat'),
                          content:  Text('Anda telah melakukan ${checkinCheck().earlycalculation()}'),
                        )
                );

              }

              );
                String test = checkinCheck().earlycalculation();
                final provider = Provider.of<checkinlist>(context, listen: false);
                int subuh = await provider.getSubuh() ;
                int zohor =await provider.getZohor() ;
                int asar =await provider.getAsar() ;
                int maghrib =await provider.getMaghrib() ;
                int isyak =await provider.getIsyak() ;
                switch(test){
                  case 'Subuh dengan Pantas' :
                    if (  subuh ==0) {
                      Provider.of<solatPoints>(context, listen: false).increasePointDouble();
                      // Provider.of<checkinlist>(context, listen: false).SubuhChecked();
                       Provider.of<checkinlist>(context, listen: false).subuhcheckin();
                      streakCalculator();
                      Provider.of<checkinlist>(context, listen: false).increaseSiapCounter();
                    }
                    break;
                  case 'Subuh' :
                    if (  subuh ==0) {
                      Provider.of<solatPoints>(context, listen: false).increasePoint();
                      // Provider.of<checkinlist>(context, listen: false).SubuhChecked();
                       Provider.of<checkinlist>(context, listen: false).subuhcheckin();
                      streakCalculator();
                      Provider.of<checkinlist>(context, listen: false).increaseSiapCounter();
                    }
                    break;
                  case 'Zohor dengan Pantas' :
                    if (  zohor==0) {
                      Provider.of<solatPoints>(context, listen: false).increasePointDouble();
                      // Provider.of<checkinlist>(context, listen: false).ZohorChecked();
                       Provider.of<checkinlist>(context, listen: false).zohorcheckin();
                      streakCalculator();
                      Provider.of<checkinlist>(context, listen: false).increaseSiapCounter();
                    }
                    break;
                  case 'Zohor' :
                    if (  zohor==0) {
                      Provider.of<solatPoints>(context, listen: false).increasePoint();
                      // Provider.of<checkinlist>(context, listen: false).ZohorChecked();
                       Provider.of<checkinlist>(context, listen: false).zohorcheckin();
                      streakCalculator();
                      Provider.of<checkinlist>(context, listen: false).increaseSiapCounter();
                    }
                    break;
                  case 'Asar dengan Pantas' :
                    if (  asar==0) {
                      Provider.of<solatPoints>(context, listen: false).increasePointDouble();
                      // Provider.of<checkinlist>(context, listen: false).AsarChecked();
                       Provider.of<checkinlist>(context, listen: false).asarcheckin();
                      streakCalculator();
                      Provider.of<checkinlist>(context, listen: false).increaseSiapCounter();
                    }
                    break;
                  case 'Asar' :
                    if (  asar ==0) {
                      Provider.of<solatPoints>(context, listen: false).increasePoint();
                      // Provider.of<checkinlist>(context, listen: false).AsarChecked();
                       Provider.of<checkinlist>(context, listen: false).asarcheckin();
                      streakCalculator();
                      Provider.of<checkinlist>(context, listen: false).increaseSiapCounter();
                    }
                    break;
                  case 'Maghrib dengan Pantas' :
                    if (  maghrib==0) {
                      Provider.of<solatPoints>(context, listen: false).increasePoint();
                      // Provider.of<checkinlist>(context, listen: false).MaghribChecked();
                       Provider.of<checkinlist>(context, listen: false).maghribcheckin();
                      streakCalculator();
                      Provider.of<checkinlist>(context, listen: false).increaseSiapCounter();
                    }
                    break;
                  case 'Maghrib' :
                    if (  maghrib==0) {
                      Provider.of<solatPoints>(context, listen: false).increasePointDouble();
                      // Provider.of<checkinlist>(context, listen: false).MaghribChecked();
                       Provider.of<checkinlist>(context, listen: false).maghribcheckin();
                      streakCalculator();
                      Provider.of<checkinlist>(context, listen: false).increaseSiapCounter();
                    }
                    break;
                  case 'Ishak dengan Pantas' :
                    if (  isyak==0) {
                      Provider.of<solatPoints>(context, listen: false).increasePointDouble();
                      isyakChecked();
                      Provider.of<checkinlist>(context, listen: false).isyakcheckin();
                      streakCalculator();
                      Provider.of<checkinlist>(context, listen: false).increaseSiapCounter();
                    }
                    break;
                  case 'Ishak' :
                    if (  isyak==0) {
                      Provider.of<solatPoints>(context, listen: false).increasePoint();
                      isyakChecked();
                      Provider.of<checkinlist>(context, listen: false).isyakcheckin();
                      streakCalculator();
                      Provider.of<checkinlist>(context, listen: false).increaseSiapCounter();
                    }
                    break;
                  default :

                }
              },
              child: Container(
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.all(10),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: enableBorder ? Border.all(
                        color:  Colors.green , // Set border color
                        width: 3.0): null,  // Set border width
                    borderRadius: const BorderRadius.all(
                        Radius.circular(10.0)), // Set rounded corner radius
                    boxShadow: const [BoxShadow(blurRadius: 10,color: Colors.black,offset: Offset(1,3))] // Make rounded corner of border
                ),
                child: const Text("Check in"),

              ),
            ),


        ],

      ),
    );
  }


}


