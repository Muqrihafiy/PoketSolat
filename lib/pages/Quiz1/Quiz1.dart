
import 'package:daily5/provider/solatPointsProvider.dart';
import 'package:easy_separator/easy_separator.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Question_Controller.dart';
import '../../helpers/iicon_with_text.dart';
import '../../helpers/ui_parameters.dart';
import 'Quiz1_Screen.dart';






class Quiz1 extends StatefulWidget {
  const Quiz1({Key? key}) : super(key: key);

  @override
  State<Quiz1> createState() => _Quiz1State();
}

class _Quiz1State extends State<Quiz1> {

  bool question1Bought = false ;


  @override
  void initState(){
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await CheckQuestion1Bought();
    });
  }

  Future<void> CheckQuestion1Bought() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    question1Bought = prefs.getBool('question1Bought') ?? false;

  }
  bool getCheckQ1 ()  {
    CheckQuestion1Bought();
    return question1Bought;
  }


  final _questionController = Get.put(QuestionController());

  @override
  Widget build(BuildContext context) {

   return Consumer<solatPoints>(
     builder:(context,solatpoints,child){
       return Column(
         mainAxisAlignment: MainAxisAlignment.center,
         mainAxisSize: MainAxisSize.min,
         children: [
           Flexible(
               child:  Ink(
                 decoration: BoxDecoration(
                   borderRadius: UIParameters.cardBorderRadius,
                   color: Theme.of(context).cardColor,
                 ),
                 child: InkWell(
                   borderRadius: UIParameters.cardBorderRadius,
                   onTap: () {
                   },
                   child: Padding(
                       padding: const EdgeInsets.all(10),
                       child: Stack(
                         clipBehavior: Clip.none,
                         children: [
                           Row(
                             crossAxisAlignment: CrossAxisAlignment.start,
                             children: [
                               ClipRRect(
                                 borderRadius: UIParameters.cardBorderRadius,
                                 child: Container(
                                   decoration: BoxDecoration(border: Border.all(color: Colors.green, width: 5)),
                                   child: Image.asset(
                                     'assets/images/logo/feqahLogo.png',
                                     fit: BoxFit.scaleDown,
                                     height: 50, // set your height
                                     width: 60, // and width here
                                   ),
                                 ),
                               ),
                               const SizedBox(
                                 width: 12,
                               ),
                               Expanded(
                                   child: Column(
                                     crossAxisAlignment: CrossAxisAlignment.start,
                                     children: [
                                       Text(
                                         "Ujian 1 (Feqah)",
                                           style: const TextStyle( color: Colors.white)
                                       ),
                                       Padding(
                                         padding: const EdgeInsets.only(top: 10, bottom: 15),
                                         child: Text("Soalan berkaitan Feqah"),
                                       ),
                                       FittedBox(
                                         fit: BoxFit.scaleDown,
                                         child: EasySeparatedRow(
                                           separatorBuilder:
                                               (BuildContext context, int index) {
                                             return const SizedBox(width: 15);
                                           },
                                           children: [
                                             IconWithText(
                                                 icon: Icon(Icons.help_outline_sharp,
                                                     color: Colors.blue[700]),
                                                 text: Text(
                                                   '10 Soalan',
                                                   style:  TextStyle(fontSize: 12,
                                                       color: Colors.blue[700]),
                                                 )),
                                             IconWithText(
                                                 icon: const Icon(Icons.timer,
                                                     color: Colors.blueGrey),
                                                 text: Text(
                                                   "10 min",
                                                   style: TextStyle(fontSize: 12,
                                                       color: Colors.blue[700]),
                                                 )),
                                           ],
                                         ),
                                       )
                                     ],
                                   ))
                             ],
                           ),
                           Positioned(
                               bottom: 10,
                               right: 10,
                               child: ElevatedButton(
                                   onPressed: () async {
                                     int points = solatpoints.getCounter();
                                     bool question1Bought = await Provider.of<solatPoints>(context, listen: false).getCheckQ1();
                                     if(question1Bought == false) {
                                       if(points >= 20){
                                         showDialog(context: context,
                                             builder: (BuildContext context)=>
                                                 AlertDialog(
                                                   title: const Text('Anda ingin bukak Quiz?'),
                                                   content:  Text('Harga kuiz = 20 points, Anda mempunyai ${solatpoints.getCounter()} pts'),
                                                   actions: <Widget>[
                                                     TextButton(
                                                     onPressed: (){
                                                       setState(() {
                                                         Provider.of<solatPoints>(context, listen: false).Question1Bought();
                                                         Provider.of<solatPoints>(context, listen: false).decreasePoint20();
                                                       });
                                                       Navigator.push(
                                                           context, MaterialPageRoute(builder: (context) =>  Quiz1Screen())
                                                       );
                                                     },
                                                     child: const Text("Ya")

                                                     ),
                                                     TextButton(
                                                         onPressed: (){
                                                           Navigator.pop(context, 'Tidak');
                                                         },
                                                         child: const Text("Tidak")

                                                     )
                                                   ],
                                                 )
                                         );
                                       }
                                       else {
                                         showDialog(context: context,
                                             builder: (BuildContext context)=>
                                                 AlertDialog(
                                                   title: const Text('Points tidak mencukupi'),
                                                   content:  Text('Anda memerlukan 20 point untuk buka'),
                                                 ));
                                       }
                                     }
                                      else{
                                       Navigator.push(
                                           context, MaterialPageRoute(builder: (context) =>  Quiz1Screen())
                                       );
                                     }
                                     },
                                   child:Icon(
                                     getCheckQ1() ?  Icons.lock_open_rounded : Icons.lock ,
                                   ),
                                   style: ElevatedButton.styleFrom(
                                     backgroundColor: Colors.purple,
                                     padding:
                                     const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                                     shape:BeveledRectangleBorder(
                                       borderRadius: const BorderRadius.only(
                                           topLeft: Radius.circular(kCardBorderrRadius),
                                           bottomRight:
                                           Radius.circular(kCardBorderrRadius)),
                                     )
                                   )
                               ))
                         ],
                       )),
                 ),
               )
           ),



         ],
       );
     }
   );

  }
}
