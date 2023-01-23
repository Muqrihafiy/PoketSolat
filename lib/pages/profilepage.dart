import 'package:daily5/models/bottomnavbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';
import 'package:flutter_profile_picture/flutter_profile_picture.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/checkinlist.dart';
import '../services/auth.dart';
import '../widgets/piechart.dart';


class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}



class _ProfilePageState extends State<ProfilePage> {
  String username = '';
  int higheststreak = 0;
  final AuthService _auth = AuthService();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await _getUsername();
      await loadHighStreak();
    });
  }

  Future<void> _getUsername() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    username = prefs.getString('firstname') ?? '';
  }

  String getUsername() {
    _getUsername();
    return username;
  }

  Future<void> loadHighStreak()  async {
    final prefs = await SharedPreferences.getInstance();
    final provider = Provider.of<checkinlist>(context, listen: false);
    int currentStreak = await provider.getStreak();
    if(currentStreak > higheststreak){
      higheststreak = currentStreak;
      prefs.setInt('higheststreak',higheststreak);
    }
  }

    int getHighStreak()  {
    loadHighStreak();
    return higheststreak;
  }



  @override
  Widget build(BuildContext context) {
    return Consumer<checkinlist>
      (builder: (context,checkinList,child){
      return Scaffold(
        backgroundColor:Colors.blueGrey[900],
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.deepPurple[900],
          title: const Text('Profile', style: TextStyle(fontSize: 22)),

        ),
        endDrawer: SizedBox(
          width: MediaQuery.of(context).size.width * 0.5, //<-- SEE HERE
          child: Drawer(
            child: ListView(
              // Important: Remove any padding from the ListView.
              padding: EdgeInsets.zero,
              children: [
                const DrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.deepPurple,
                  ),
                  child: Text(''),
                ),
                // ListTile(
                //   leading: Icon(
                //     Icons.exit_to_app,
                //   ),
                //   title: const Text('Bubar akaun'),
                //   onTap: ()  {
                //     showDialog(context: context,
                //         builder: (BuildContext context)=>
                //             AlertDialog(
                //               title: const Text('Bubar Akaun'),
                //               content:  Text('Anda pasti ingin bubar akaun? Data dan akaun anda akan hilang selamanya'),
                //               actions: <Widget>[
                //                 TextButton(
                //                     onPressed: () async {
                //
                //                        SharedPreferences prefs = await SharedPreferences.getInstance();
                //                        await prefs.clear();
                //                        await _auth.signOut();
                //                     },
                //                     child: const Text("Ya")
                //
                //                 ),
                //                 TextButton(
                //                     onPressed: (){
                //                       Navigator.pop(context, 'Tidak');
                //                     },
                //                     child: const Text("Tidak")
                //
                //                 )
                //               ],
                //             )
                //     );
                //
                //
                //   },
                // ),
                ListTile(
                  leading: Icon(
                    FontAwesomeIcons.globe,
                  ),
                  title: const Text('Version 1.0.0+'),

                ),
                ListTile(
                  leading: Icon(
                    FontAwesomeIcons.arrowsRotate,
                  ),
                  title: const Text('Refresh App'),
                  onTap: ()  {
                    Get.offAll(() => bottomnavbar());
                  },
                ),
                ListTile(
                  leading: Icon(
                    FontAwesomeIcons.trophy,
                  ),
                  title: const Text('Pencapaian'),
                  onTap: ()  {
                    showDialog(context: context,
                        builder: (BuildContext context)=>
                            AlertDialog(
                              title: const Text('Laman Pencapaian'),
                              content:  Text('Akan Datang'),

                            ) );
                  },
                ),
              ],
            ),
          ),
        ),

        body: SingleChildScrollView(
          child:Column(
            children: <Widget>[
              Container(
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Colors.redAccent, Colors.pinkAccent]
                      )
                  ),
                  child: SizedBox(
                    width: double.infinity,
                    height: 350.0,
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          ProfilePicture(
                            name: username,
                            radius: 31,
                            fontsize: 21,
                            random: false,
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            username,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 22.0,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                            child: Column(children: [
                              FAProgressBar(
                                currentValue: Provider.of<checkinlist>(context, listen: false).getHealth(),
                                maxValue: 5,
                                changeProgressColor: Colors.red,
                                backgroundColor: Colors.pinkAccent,
                                progressColor: Colors.green,
                                displayText: ' HEALTH',
                              )
                            ],
                            ),
                          ),
                          Card(
                            margin: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 5.0),
                            clipBehavior: Clip.antiAlias,
                            color: Colors.white,
                            elevation: 5.0,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 22.0),
                              child: Row(
                                children: <Widget>[
                                  Expanded(
                                    child: Column(

                                      children:  <Widget>[
                                        const Text(
                                          " Solat Selesai",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: Colors.redAccent,
                                            fontSize: 14.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 5.0,
                                        ),
                                        Text(
                                          '${checkinList.getSiap()}',
                                          style: const TextStyle(
                                            fontSize: 18.0,
                                            color: Colors.pinkAccent,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),

                                  Expanded(

                                    child: Column(

                                      children:  <Widget>[
                                        const Text(
                                          "Jumlah Solat Tinggal",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: Colors.redAccent,
                                            fontSize: 14.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 5.0,
                                        ),
                                        Text(
                                          '${checkinList.getLate()}',
                                          style: const TextStyle(
                                            fontSize: 18.0,
                                            color: Colors.pinkAccent,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Column(

                                      children:  <Widget>[
                                        const Text(
                                          "Streak Tertinggi",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: Colors.redAccent,
                                            fontSize: 14.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 5.0,
                                        ),
                                        Text(
                                          '${getHighStreak()}',
                                          style:  const TextStyle(
                                            fontSize: 18.0,
                                            color: Colors.pinkAccent,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )


                        ],
                      ),
                    ),
                  )
              ),
              Text(
                  'Solat-Solat tinggal',
                style:  const TextStyle(
                  fontSize: 18.0,
                  color: Colors.white,
                ),
              ),
              PieChartSample2(),
            ],
          ),
        )
      );
    },
    );
  }
}