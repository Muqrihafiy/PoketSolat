import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widgets/iconfile.dart';



class SplashPage extends StatefulWidget{
  final int duration ;
  final Widget goToPage;

  const SplashPage({Key? key, required this.goToPage,required this.duration }) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {


    Future.delayed(Duration(seconds: widget.duration),() {
      // Get.to(() => widget.goToPage);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => widget.goToPage)
      );
    });


    return Scaffold(
        body: Container(
            color: const Color(0xFF50248F),
            alignment: Alignment.center,
            child: Image.asset(
              'assets/images/logo/splashlogo.png',
            ),
        )
    );
  }
}