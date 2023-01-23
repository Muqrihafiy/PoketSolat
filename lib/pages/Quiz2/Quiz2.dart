import 'package:daily5/helpers/iicon_with_text.dart';
import 'package:daily5/helpers/ui_parameters.dart';
import 'package:daily5/provider/solatPointsProvider.dart';
import 'package:easy_separator/easy_separator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import 'Question2_Controller.dart';
import 'Quiz2_Screen.dart';

class Quiz2 extends StatefulWidget {
  const Quiz2({Key? key}) : super(key: key);

  @override
  State<Quiz2> createState() => _Quiz2State();
}

class _Quiz2State extends State<Quiz2> {


  final _questionController = Get.put(Question2Controller());

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
                                        'assets/images/logo/sirah.jpg',
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
                                              "Ujian 2 (Sirah)",
                                              style: const TextStyle( color: Colors.white)
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(top: 10, bottom: 15),
                                            child: Text("Soalan berkaitan Sirah"),
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
                                                      '20 Soalan',
                                                      style:  TextStyle(fontSize: 12,
                                                          color: Colors.blue[700]),
                                                    )),
                                                IconWithText(
                                                    icon: const Icon(Icons.timer,
                                                        color: Colors.blueGrey),
                                                    text: Text(
                                                      "20 min",
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
                                        bool question2Bought =await Provider.of<solatPoints>(context, listen: false).getCheckQ2();
                                        if(question2Bought == false) {
                                          if(points >= 30){
                                            showDialog(context: context,
                                                builder: (BuildContext context)=>
                                                    AlertDialog(
                                                      title: const Text('Anda ingin bukak Quiz?'),
                                                      content:  Text('Harga kuiz = 30 points, Anda mempunyai ${solatpoints.getCounter()} pts'),
                                                      actions: <Widget>[
                                                        TextButton(
                                                            onPressed: (){
                                                              setState(() {
                                                                Provider.of<solatPoints>(context, listen: false).Question2Bought();
                                                                Provider.of<solatPoints>(context, listen: false).decreasePoint30();
                                                              });
                                                              Navigator.push(
                                                                  context, MaterialPageRoute(builder: (context) =>  Quiz2Screen())
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
                                                      content:  Text('Anda memerlukan 30 point untuk buka'),
                                                    ));
                                          }
                                        }
                                        else{
                                          Navigator.push(
                                              context, MaterialPageRoute(builder: (context) =>  Quiz2Screen())
                                          );
                                        }
                                      },
                                      child:Icon(
                                        solatpoints.question2Bought ? Icons.lock_open_rounded : Icons.lock,
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