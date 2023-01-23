import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Question_Controller.dart';
import 'Question_card.dart';
import 'progress_bar.dart';


class Body extends StatelessWidget {
  const Body({
     Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // So that we have acccess our controller
    QuestionController _questionController = Get.put(QuestionController());
    return Stack(
      children: [
        // SvgPicture.asset("assets/icons/bg.svg", fit: BoxFit.fill),
        SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding:
                EdgeInsets.symmetric(horizontal:20.0),
                child: ProgressBar(),
              ),
              SizedBox(height: 20.0),
              Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 20.0),
                child: Obx(
                      () => Text.rich(
                    TextSpan(
                      text:
                      "Question ${_questionController.questionNumber.value}",
                      style: TextStyle(
                        color: Color(0xFF8B94BC),
                        wordSpacing: 0.15,
                        fontSize: 20.0,
                        fontWeight: FontWeight.w500,
                      ),
                      children: [
                        TextSpan(
                          text: "/${_questionController.questions.length}",
                          style: TextStyle(
                            color: Color(0xFF8B94BC),
                            wordSpacing: 0.15,
                            fontSize: 20.0,
                            fontWeight: FontWeight.w500,
                          )
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Divider(thickness: 1.5),
              SizedBox(height: 20.0),
              Expanded(
                child: PageView.builder(
                  // Block swipe to next qn
                  physics: NeverScrollableScrollPhysics(),
                  controller: _questionController.pageController,
                  onPageChanged: _questionController.updateTheQnNum,
                  itemCount: _questionController.questions.length,
                  itemBuilder: (context, index) => QuestionCard(
                      question: _questionController.questions[index]),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}