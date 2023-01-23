import 'package:daily5/pages/welcomepage.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';



class IntroductionPage extends StatefulWidget {
  @override
  _IntroductionPageState createState() => _IntroductionPageState();
}

class _IntroductionPageState extends State<IntroductionPage> {
  final introKey = GlobalKey<IntroductionScreenState>();

  void _onIntroEnd(context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => WelcomePage()),
    );
  }



  Widget _buildImage(String assetName, [double width = 200]) {
    return Image.asset('assets/$assetName', width: width, alignment:Alignment.bottomCenter,);
  }

  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(fontSize: 19.0);

    const pageDecoration = const PageDecoration(
      titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
      bodyTextStyle: bodyStyle,
      bodyPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Colors.deepPurple,
      imagePadding: EdgeInsets.zero,
    );

    return IntroductionScreen(
      key: introKey,
      globalBackgroundColor: Colors.deepPurple[600],
      allowImplicitScrolling: true,
      autoScrollDuration: null,     globalHeader: Align(
        alignment: Alignment.topRight,

      ),
      // globalFooter: SizedBox(
      //   width: double.infinity,
      //   height: 60,
      //   child: ElevatedButton(
      //     child: const Text(
      //       'Let\'s go right away!',
      //       style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
      //     ),
      //     onPressed: () => _onIntroEnd(context),
      //   ),
      // ),
      pages: [
        PageViewModel(
          title: "Selamat datang ke Poket Solat",
            bodyWidget: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text("Belajar mengurus solat fardu dalam bentuk gamifikasi",),
              ],
            ),
            decoration: pageDecoration.copyWith(
              bodyFlex: 2,
              imageFlex: 4,
              bodyAlignment: Alignment.bottomCenter,
              imageAlignment: Alignment.bottomCenter,
            ),
          image: _buildImage('images/gamification.png'),
        ),
        PageViewModel(
          title: "Dapatkan points setiap kali check in Solat",
          bodyWidget: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text("2 Points jika check in 30 minit awal, 1 point jika check in biasa",),
            ],
          ),
          decoration: pageDecoration.copyWith(
            bodyFlex: 2,
            imageFlex: 4,
            bodyAlignment: Alignment.bottomCenter,
            imageAlignment: Alignment.bottomCenter,
          ),
          image: _buildImage('images/prayertime.png'),

        ),
        PageViewModel(
          title: "Bunga Solat ",
          bodyWidget: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text( "Bunga solat ini akan bertukar warna berdasarkan keawalan atau kelewatan solat",),
            ],
          ),
          decoration: pageDecoration.copyWith(
            bodyFlex: 2,
            imageFlex: 4,
            bodyAlignment: Alignment.bottomCenter,
            imageAlignment: Alignment.bottomCenter,
          ),
          image: _buildImage('images/flowergrdenpic.JPG'),
        ),

        PageViewModel(
          title: "Kumpul dan Simpan Point",
          bodyWidget: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text("Gunakan point untuk membuka fungsi-fungsi menarik!",),
            ],
          ),
          decoration: pageDecoration.copyWith(
            bodyFlex: 2,
            imageFlex: 4,
            bodyAlignment: Alignment.bottomCenter,
            imageAlignment: Alignment.bottomCenter,
          ),
          image: _buildImage('images/collectpoint.png'),
        ),
        PageViewModel(
          title: "Jangan Tinggal Solat! ",
          bodyWidget: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text("Setiap solat yang ditinggalkan akan ditolak satu nyawa yang diperlukan untuk membuka sesuatu fungsi",),
            ],
          ),
          decoration: pageDecoration.copyWith(
            bodyFlex: 2,
            imageFlex: 4,
            bodyAlignment: Alignment.bottomCenter,
            imageAlignment: Alignment.bottomCenter,
          ),
          image: _buildImage('images/heart.png'),

        ),
        PageViewModel(
          title: "Semoga anda dapat beramal sambil bermain",
          bodyWidget: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          ),
          decoration: pageDecoration.copyWith(
          bodyFlex: 2,
          imageFlex: 4,
          bodyAlignment: Alignment.bottomCenter,
          imageAlignment: Alignment.bottomCenter,
          ),

          image: _buildImage('images/lelakisolat.PNG'),
        ),
      ],
      onDone: () => _onIntroEnd(context),
      //onSkip: () => _onIntroEnd(context), // You can override onSkip callback
      showSkipButton: false,
      skipOrBackFlex: 0,
      nextFlex: 0,
      showBackButton: true,
      //rtl: true, // Display as right-to-left
      back: const Icon(Icons.arrow_back),
      skip: const Text('Skip', style: TextStyle(fontWeight: FontWeight.w600)),
      next: const Icon(Icons.arrow_forward),
      done: const Text('Done', style: TextStyle(fontWeight: FontWeight.w600)),
      curve: Curves.fastLinearToSlowEaseIn,
      controlsMargin: const EdgeInsets.all(16),
      controlsPadding: kIsWeb
          ? const EdgeInsets.all(12.0)
          : const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0),
        color: Color(0xFFBDBDBD),
        activeSize: Size(22.0, 10.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
      dotsContainerDecorator: const ShapeDecoration(
        color: Colors.black87,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
      ),
    );
  }
}