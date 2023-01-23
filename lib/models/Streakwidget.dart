
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import 'checkinlist.dart';

class StreakWidget extends StatefulWidget{
  const StreakWidget({Key? key}) : super(key: key);


  @override
  State<StreakWidget > createState() => _StreakWidgetState();
}



class _StreakWidgetState extends State<StreakWidget > {



  @override
  Widget build(BuildContext context) {
    return Consumer<checkinlist>(
        builder: (context,checkinlist, child)
    {
    return Container(
      // height: Get.width / 2,
      margin: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 12,
      ),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.deepOrangeAccent,
        borderRadius: BorderRadius.circular(12),
      ),
      child:
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(right: 8),
                  child: const Icon(
                    FontAwesomeIcons.fire,
                    color: Colors.white,
                    size: 14,
                  ),
                ),
                const Expanded(
                  child: Text(
                    "Current Streak",
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
                  "${checkinlist.getStreak()} Prayers",
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.right,
                ),
              ],
            )
          ],
        )
    );
  }
  );
  }

}


