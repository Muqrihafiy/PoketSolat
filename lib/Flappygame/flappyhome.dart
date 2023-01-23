import 'package:daily5/Flappygame/game_widget.dart';
import 'package:daily5/provider/solatPointsProvider.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';


import '../../helpers/ui_parameters.dart';
import '../models/checkinlist.dart';







class FlappyHome extends StatefulWidget {
  const FlappyHome({Key? key}) : super(key: key);

  @override
  State<FlappyHome> createState() => _FlappyHomeState();
}

class _FlappyHomeState extends State<FlappyHome> {



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
                                      decoration: BoxDecoration(border: Border.all(color: Colors.blue, width: 5)),
                                      child: Image.asset(
                                        'assets/images/sprites/bluebird-midflap.png',
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
                                            "Flappy Game",
                                              style: const TextStyle( color: Colors.white)
                                          ),
                                          const Padding(
                                            padding: EdgeInsets.only(top: 10, bottom: 15),
                                            child: Text("Permainan FlappyBird"),
                                          ),

                                        ],
                                      ))
                                ],
                              ),
                              Positioned(
                                  bottom: 10,
                                  right: 10,
                                  child: ElevatedButton(
                                      onPressed: (){
                                        int points = solatpoints.getCounter();
                                        double health = Provider.of<checkinlist>(context, listen: false).getHealth();
                                          if(points >= 5 && health >= 3 ){
                                            showDialog(context: context,
                                                builder: (BuildContext context)=>
                                                    AlertDialog(
                                                      title: const Text('Anda ingin main Flappy Game?'),
                                                      content:  Text('Harga Flappy Game = 5 points, Anda mempunyai ${solatpoints.getCounter()} pts'),
                                                      actions: <Widget>[
                                                        TextButton(
                                                            onPressed: (){
                                                              setState(() {
                                                                Provider.of<solatPoints>(context, listen: false).decreasePoint5();
                                                              });
                                                              Navigator.push(
                                                                  context, MaterialPageRoute(builder: (context) =>  const FlappyAmberGameWidget())
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
                                                  title: Text('Points atau Health tidak mencukupi'),
                                                  content:  Text('Anda memerlukan 5 point dan sekurang-kurangnya 3 nyawa'),
                                                ));
                                          }


                                      },
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
                                      ),
                                      child:Icon(
                                         Icons.lock ,
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
