import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Question_Controller.dart';
import 'Components/Body.dart';

class Quiz1Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    QuestionController _controller = Get.put(QuestionController());
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
      body: Body(key: null),
    );
  }
}