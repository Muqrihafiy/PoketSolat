
import 'package:daily5/pages/pokokilmu.dart';
import 'package:flutter/material.dart';

import 'activitypage.dart';



class ActivityHome extends StatefulWidget{
  const ActivityHome({Key? key}) : super(key: key);


  @override
  _ActivityHomeState createState() => _ActivityHomeState();
}
class _ActivityHomeState extends State<ActivityHome> {


  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.deepPurple[900],
          flexibleSpace: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TabBar(
                indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(50), // Creates border
                    color: Colors.greenAccent),
                tabs: [
                  Text('Aktiviti', style: const TextStyle(fontSize: 25),),
                  Text('Pokok Ilmu',style: const TextStyle(fontSize: 25),),
                ],
              )
            ],
          ),
        ),
        body: TabBarView(
          children: [
            ActivityPage(),
            PokokIlmu(),
          ],
        ),
        ),

      );

  }
}
