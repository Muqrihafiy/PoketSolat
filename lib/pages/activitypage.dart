import 'package:daily5/provider/solatPointsProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


import '../Flappygame/flappyhome.dart';
import 'Quiz1/Quiz1.dart';
import 'Quiz2/Quiz2.dart';
import 'Tasbih/Tasbihhome.dart';


class ActivityPage extends StatefulWidget {
  const ActivityPage({Key? key}) : super(key: key);

  @override
  State<ActivityPage> createState() => ActivityPageState();
}

class ActivityPageState extends State<ActivityPage> {

  @override
  Widget build(BuildContext context) {
    return Consumer<solatPoints>(
      builder: (context,solatpoints,child)
      {
        return Scaffold(
          body: Container(
            decoration: BoxDecoration(
              color: Colors.blueGrey[900],
            ),
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                        ),
                            Text('Apakah yang anda ingin lakukan harini ?',
                                style: TextStyle(
                                    fontSize: 22, fontWeight: FontWeight.w700, color:
                                Colors.white)
                            ),
                            const SizedBox(
                              width: 12,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 15, bottom: 10, right: 10),
                              child: Text('Pts:${solatpoints.getCounter()}',
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(fontSize: 25, color: Colors.white)
                              ),
                            ),
                          ],
                        ),

                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),

                      child:
                      Column(
                        children: [
                          Quiz1(),
                          Quiz2(),
                          SizedBox(height: 20.0 / 2),
                          TasbihHome(),
                          SizedBox(height: 20.0 / 2),
                          FlappyHome(),
                        ],
                      ) ,


                    ),
                  )
                ],
              ),
            ),
          ),

        );
      }
    );
  }
}