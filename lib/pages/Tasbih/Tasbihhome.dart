import 'package:daily5/pages/Tasbih/Tasbih.dart';
import 'package:daily5/provider/solatPointsProvider.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';


import '../../helpers/ui_parameters.dart';







class TasbihHome extends StatefulWidget {
  const TasbihHome({Key? key}) : super(key: key);

  @override
  State<TasbihHome> createState() => _TasbihHomeState();
}

class _TasbihHomeState extends State<TasbihHome> {



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
                                    child:  Container(
                                      decoration: BoxDecoration(border: Border.all(color: Colors.blue, width: 5)),
                                      child: Image.asset(
                                        'assets/images/logo/tasbihlogo.png',
                                        fit: BoxFit.scaleDown,
                                        height: 50, // set your height
                                        width: 60, // and width here
                                      ),
                                    )
                                  ),
                                  const SizedBox(
                                    width: 12,
                                  ),
                                  Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            "Tasbih",
                                              style: const TextStyle( color: Colors.white)
                                          ),
                                          const Padding(
                                            padding: EdgeInsets.only(top: 10, bottom: 15),
                                            child: Text("Tasbih Digital",
                                            ),
                                          ),

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
                                        bool tasbihBought = await Provider.of<solatPoints>(context, listen: false).getCheckTasbih();
                                        if(tasbihBought == false) {
                                          if(points >= 30){
                                            showDialog(context: context,
                                                builder: (BuildContext context)=>
                                                    AlertDialog(
                                                      title: const Text('Anda ingin bukak Tasbih?'),
                                                      content:  Text('Harga Tasbih = 30 points, Anda mempunyai ${solatpoints.getCounter()} pts'),
                                                      actions: <Widget>[
                                                        TextButton(
                                                            onPressed: (){
                                                              setState(() {
                                                                Provider.of<solatPoints>(context, listen: false).TasbihBought();
                                                                Provider.of<solatPoints>(context, listen: false).decreasePoint30();
                                                              });
                                                              Navigator.push(
                                                                  context, MaterialPageRoute(builder: (context) =>  Tasbih())
                                                              );
                                                            },
                                                            child: const Text("Ya")

                                                        ),
                                                        TextButton(
                                                            onPressed: (){
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
                                                    const AlertDialog(
                                                      title: Text('Points tidak mencukupi'),
                                                      content:  Text('Anda memerlukan 30 point untuk buka'),
                                                    ));
                                          }
                                        }
                                        else{
                                          Navigator.push(
                                              context, MaterialPageRoute(builder: (context) =>  Tasbih())
                                          );
                                        }
                                      },
                                      child:Icon(
                                        solatpoints.tasbihBought ?  Icons.lock_open_rounded : Icons.lock ,
                                      ),
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.purple,
                                          padding:
                                          const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                                          shape:const BeveledRectangleBorder(
                                            borderRadius: BorderRadius.only(
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
