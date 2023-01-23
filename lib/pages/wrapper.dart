import 'package:daily5/models/bottomnavbar.dart';
import 'package:daily5/pages/splashpage.dart';
import 'package:daily5/pages/welcomepage.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:daily5/models/myuser.dart';

import 'introduction.dart';


class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final user = Provider.of<MyUser?>(context);
    print(user);
    if (user==null){
      return SplashPage(duration: 3, goToPage: IntroductionPage());
    } else {
      return const SplashPage(duration: 3, goToPage: bottomnavbar());
    }
  }
}
