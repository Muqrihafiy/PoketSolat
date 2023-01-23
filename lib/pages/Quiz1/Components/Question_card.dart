import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Question_Controller.dart';

import 'QuestionModel.dart';
import 'option.dart';


class QuestionCard extends StatelessWidget {
  const QuestionCard({
    Key? key,
    // it means we have to pass this
    required this.question,
  }) : super(key: key);

  final Question question;

  @override
  Widget build(BuildContext context) {
    QuestionController _controller = Get.put(QuestionController());
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.0),
      padding: EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
      ),
      child: SingleChildScrollView(
        child:Column(
          children: [
            Text(
              question.question,
              style: Theme.of(context)
                  .textTheme
                  .headline6,
              selectionColor:  Color(0xFF000000),
            ),
            SizedBox(height: 20.0 / 2),
            ...List.generate(
              question.options.length,
                  (index) => Option(
                index: index,
                text: question.options[index],
                press: () => _controller.checkAns(question, index),
              ),
            ),
          ],
        ) ,
      )
    );
  }
}