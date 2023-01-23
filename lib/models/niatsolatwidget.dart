import 'package:daily5/provider/bacaansolat.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NiatWaktu extends StatefulWidget{
  const NiatWaktu({
    Key? key,


  }) : super(key: key);





  @override
  State<NiatWaktu> createState() => _NiatWaktuState();
}


class _NiatWaktuState extends State<NiatWaktu> {

  String arabic = '';
  String latin = '';
  String terjemahan = '';



  @override
  Widget build(BuildContext context) {
    return Container(
      // height: Get.width / 2,
      margin: const EdgeInsets.symmetric(
        horizontal: 16,

      ),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Container(
                margin: const EdgeInsets.only(right: 8),
              ),
              const Expanded(
                child: Text(
                  "Info Solat",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.blueAccent,
                    fontWeight: FontWeight.w500,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),

            ],
          ),
          Container(
            margin: const EdgeInsets.only(top: 10, bottom: 12),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(8),
                  child: Row(
                    mainAxisAlignment:
                    MainAxisAlignment.center,
                    crossAxisAlignment:
                    CrossAxisAlignment.center,
                    children: [
                      Expanded(
                          child: Container(
                            padding: EdgeInsets.only(bottom: 8),
                            child: Column(
                              mainAxisAlignment:
                              MainAxisAlignment.center,
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: 8, right: 8),
                                  child: Text(
                                    "${Provider.of<bacaansolat>(context, listen: false).niatsolatarab()}",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight:
                                        FontWeight.bold),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: 8, right: 8),
                                  child: Text(
                                    "${Provider.of<bacaansolat>(context, listen: false).niatsolatlatin()}",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontStyle:
                                        FontStyle.italic),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: 8,
                                      right: 8,
                                      top: 5),
                                  child: Text(
                                      "${Provider.of<bacaansolat>(context, listen: false).niatsolatterjemahan()}",
                                      style: TextStyle(
                                        fontSize: 12,
                                      )),
                                )
                              ],
                            ),
                          ))
                    ],
                  ),
                ),
              ],
            ),
          ),

        ],

      ),
    );
  }
}

