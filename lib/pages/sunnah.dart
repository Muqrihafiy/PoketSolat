import 'dart:convert';
import 'package:daily5/models/checkinlist.dart';
import 'package:daily5/models/modelbacaan.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' as rootBundle;
import 'package:provider/provider.dart';

import '../provider/solatPointsProvider.dart';



class Sunnah extends StatefulWidget {
  const Sunnah({Key? key}) : super(key: key);

  @override
  State<Sunnah> createState() => _SunnahState();
}


class _SunnahState extends State<Sunnah> {

  Future<List<ModelBacaan>> ReadJsonData() async {
    if  (prayerTimes.currentPrayer().index == 1) {
      final jsondata =
      await rootBundle.rootBundle.loadString('assets/solatsunatdata/sunatsubuh.json');
      final list = json.decode(jsondata) as List<dynamic>;
      return list.map((e) => ModelBacaan.fromJson(e)).toList();
    }
    else if (prayerTimes.currentPrayer().index == 3) {
      final jsondata =
      await rootBundle.rootBundle.loadString('assets/solatsunatdata/sunatzohor.json');
      final list = json.decode(jsondata) as List<dynamic>;
      return list.map((e) => ModelBacaan.fromJson(e)).toList();
    }
    else if (prayerTimes.currentPrayer().index == 4) {
      final jsondata =
      await rootBundle.rootBundle.loadString('assets/solatsunatdata/sunatasar.json');
      final list = json.decode(jsondata) as List<dynamic>;
      return list.map((e) => ModelBacaan.fromJson(e)).toList();
    }
    else if (prayerTimes.currentPrayer().index == 5) {
      final jsondata =
      await rootBundle.rootBundle.loadString('assets/solatsunatdata/sunatmaghrib.json');
      final list = json.decode(jsondata) as List<dynamic>;
      return list.map((e) => ModelBacaan.fromJson(e)).toList();
    }
    else if (prayerTimes.currentPrayer().index == 6){
      final jsondata =
      await rootBundle.rootBundle.loadString('assets/solatsunatdata/sunatisyak.json');
      final list = json.decode(jsondata) as List<dynamic>;
      return list.map((e) => ModelBacaan.fromJson(e)).toList();
    }
    else {
      final jsondata =
      await rootBundle.rootBundle.loadString('assets/solatsunatdata/sunatdhuha.json');
      final list = json.decode(jsondata) as List<dynamic>;
      return list.map((e) => ModelBacaan.fromJson(e)).toList();
    }
  }





   bool buttonappear (){
     if  (prayerTimes.currentPrayer().index == 2) {
       return false;
     }
     else {
       return true;
     }
   }

   sunnahchecker(){
     bool sunnahsubuh = Provider.of<checkinlist>(context, listen: false).getSunnahSubuh();
     bool sunnahzohor = Provider.of<checkinlist>(context, listen: false).getSunnahZohor();
     bool sunnahasar = Provider.of<checkinlist>(context, listen: false).getSunnahAsar();
     bool sunnahmaghrib = Provider.of<checkinlist>(context, listen: false).getSunnahMaghrib();
     bool sunnahisyak = Provider.of<checkinlist>(context, listen: false).getSunnahIsyak();
     String done = 'Tahniah lakukan Solat Sunnah!';
     String tekandua = 'Anda telah lakukan perbuatan ini';

    if(prayerTimes.currentPrayer().index == 1){
      if(sunnahsubuh == false){
        Provider.of<solatPoints>(context, listen: false).increasePoint();
        Provider.of<checkinlist>(context, listen: false).SunnahSubuhDone();
        return done;
      }
      else {
        return tekandua;
      }
    }
     else if(prayerTimes.currentPrayer().index == 3){
       if(sunnahzohor == false){
         Provider.of<solatPoints>(context, listen: false).increasePoint();
         Provider.of<checkinlist>(context, listen: false).SunnahZohorDone();
         return done;
       }
       else {
         return tekandua;
       }
     }
    else if(prayerTimes.currentPrayer().index == 4){
      if(sunnahasar == false){
        Provider.of<solatPoints>(context, listen: false).increasePoint();
        Provider.of<checkinlist>(context, listen: false).SunnahAsarDone();
        return done;
      }
      else {
        return tekandua;
      }
    }
    else if(prayerTimes.currentPrayer().index == 5){
      if(sunnahmaghrib == false){
        Provider.of<solatPoints>(context, listen: false).increasePoint();
        Provider.of<checkinlist>(context, listen: false).SunnahMaghribDone();
        return done;
      }
      else {
        return tekandua;
      }
    }
    else if(prayerTimes.currentPrayer().index == 6){
      if(sunnahisyak == false){
        Provider.of<solatPoints>(context, listen: false).increasePoint();
        Provider.of<checkinlist>(context, listen: false).SunnahIsyakDone();
        return done;
      }
      else {
        return tekandua;
      }
    }
   }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple[900],
        elevation: 0.0,
      ),
      backgroundColor: Colors.blueGrey[900],
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(

            ),
            const SizedBox(height: 10),
            Expanded(
              child: FutureBuilder(
                future: ReadJsonData(),
                builder: (context, data) {
                  if (data.hasError) {
                    return Center(child: Text("${data.error}"));
                  } else if (data.hasData) {
                    var items = data.data as List<ModelBacaan>;
                    return ListView.builder(
                        itemCount: items == null ? 0 : items.length,
                        itemBuilder: (context, index) {
                          return Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            elevation: 5,
                            margin: const EdgeInsets.all(15),
                            child: Theme(
                              data: Theme.of(context)
                                  .copyWith(dividerColor: Colors.transparent),
                              child: ExpansionTile(
                                title: Text(
                                  items[index].name.toString(),
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),

                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(8),
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      crossAxisAlignment:
                                      CrossAxisAlignment.center,
                                      children: [
                                        Expanded(
                                            child: Container(
                                              padding: const EdgeInsets.only(bottom: 8),
                                              child: Column(
                                                mainAxisAlignment:
                                                MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding: const EdgeInsets.only(
                                                        left: 8, right: 8),
                                                    child: Text(
                                                      items[index]
                                                          .arabic
                                                          .toString(),
                                                      style: const TextStyle(
                                                          fontSize: 16,
                                                          fontWeight:
                                                          FontWeight.bold),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets.only(
                                                        left: 8, right: 8),
                                                    child: Text(
                                                      items[index]
                                                          .latin
                                                          .toString(),
                                                      style: const TextStyle(
                                                          fontSize: 14,
                                                          fontStyle:
                                                          FontStyle.italic),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets.only(
                                                        left: 8,
                                                        right: 8,
                                                        top: 5),
                                                    child: Text(
                                                        items[index]
                                                            .terjemahan
                                                            .toString(),
                                                        style: const TextStyle(
                                                          fontSize: 12,
                                                        )),
                                                  )
                                                ],
                                              ),
                                            )),
                                        Visibility(
                                            visible: buttonappear(),
                                            child:
                                            ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                    backgroundColor: Colors.blueGrey.shade900),
                                                onPressed: () {
                                                  sunnahchecker();
                                                  setState(() {
                                                    showDialog(context: context,
                                                        builder: (BuildContext context)=>
                                                            AlertDialog(
                                                              title: const Text('Selesai Solat'),
                                                              content:  Text(' ${sunnahchecker()}'),
                                                            )
                                                    );
                                                  });
                                                },
                                                child: const Text('solat'))),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        });
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}