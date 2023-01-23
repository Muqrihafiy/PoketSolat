import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Question2_Controller.dart';

import 'QuestionModel2.dart';
import 'option2.dart';


class Question2Card extends StatelessWidget {
  const Question2Card({
    Key? key,
    // it means we have to pass this
    required this.question,
  }) : super(key: key);

  final Question2 question;

  @override
  Widget build(BuildContext context) {
    Question2Controller _controller = Get.put(Question2Controller());
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
                    (index) => Option2(
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