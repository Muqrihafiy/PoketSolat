import 'package:flutter/material.dart';
import 'package:get/get.dart';



import 'Components/Body2.dart';
import 'Question2_Controller.dart';

class Quiz2Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Question2Controller _controller = Get.put(Question2Controller());
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        // Fluttter show the back button automatically
        backgroundColor: Colors.transparent,
        elevation: 0,
        // actions: [
        //   TextButton(onPressed: _controller.nextQuestion, child: Text("Skip")),
        // ],
      ),
      body: Body2(key: null),
    );
  }
}