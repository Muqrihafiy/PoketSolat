

import 'package:daily5/models/checkinlist.dart';
import 'package:daily5/models/myuser.dart';

import 'package:daily5/pages/wrapper.dart';
import 'package:daily5/provider/InventoryProvider.dart';
import 'package:daily5/provider/bacaansolat.dart';
import 'package:daily5/provider/checkinProvider.dart';
import 'package:daily5/provider/solatPointsProvider.dart';
import 'package:daily5/services/auth.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'helpers/Notifications.dart';




void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // SharedPreferences solatprefs = await SharedPreferences.getInstance();
  //  await solatprefs.clear();
  await Firebase.initializeApp();


  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    return MultiProvider(
      providers: [
        StreamProvider<MyUser?>.value(
          initialData: null,
          value: AuthService().user,
        ),
        ChangeNotifierProvider<solatPoints>(
          create: (_) => solatPoints(),
        ),
        Provider(
          create: (_) => checkinCheck(),
        ),
        ChangeNotifierProvider<checkinlist>(
          create: (_) => checkinlist(),
        ),
        ChangeNotifierProvider<InventoryProvider>(
          create: (_) => InventoryProvider(),
        ),
        Provider(
          create: (_) => bacaansolat(),
        ),
      ],
      child: GetMaterialApp(
          title: 'pixeloid',
          theme: ThemeData(fontFamily: 'pixeloid'),
          debugShowCheckedModeBanner: false,
          home: const Wrapper(),

      ),
    );
  }
}


