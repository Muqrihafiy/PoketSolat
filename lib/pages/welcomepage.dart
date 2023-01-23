import 'package:page_transition/page_transition.dart';
import 'package:flutter/material.dart';

import '../widgets/enterusername.dart';


class WelcomePage extends StatefulWidget{


  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {




  @override
  Widget build(BuildContext context) {


    return Scaffold(
        body: Container(
          color: Colors.black,
          child: Stack(
            children: [
              Positioned.fill(
                  child:Opacity(
                    opacity: 0.3,
                    child: Image.asset('android/assets/img/mosque.png',
                        fit: BoxFit.cover),
                  )
              ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ClipOval(
                      child: Container(
                        child:  Image.asset(
                  'assets/images/mainlogo.png',
                ),
                        width:180,
                        height: 180,
                        color: Colors.transparent,

                      ),
                    ),
                    const SizedBox(height: 50),
                    const Text('Poket Solat',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 40,
                            fontWeight: FontWeight.bold
                        )
                    ),
                    const SizedBox(height:40),
                    const Text('Ayuh jaga Solat kita !',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18
                      ),
                    ),
                    const SizedBox(height:40),
                    ElevatedButton(
                        style:ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20),
                          backgroundColor: Colors.deepPurple,),
                        onPressed: () {

                          Navigator.push(
                              context,
                              PageTransition(type: PageTransitionType.fade, child: UsernamePage()
                          ));
                        },
                        child: const Text('Salam!',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold
                            )
                        )
                    )
                  ],
                ),
              )
            ],
          ),
        )
    );
  }
}

