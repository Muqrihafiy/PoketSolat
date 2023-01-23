import 'package:daily5/models/bottomnavbar.dart';
import 'package:daily5/provider/solatPointsProvider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';


import 'Question_Controller.dart';

class ScoreScreen1 extends StatefulWidget {
  final int correctNum;

  ScoreScreen1({required this.correctNum});

  @override
  State<ScoreScreen1> createState() => _ScoreScreen1State();
}

class _ScoreScreen1State extends State<ScoreScreen1> {

  scoreconverter(){
    bool question1answered = Provider.of<solatPoints>(context, listen: false).getCheckQ1ans();
    String fullmark = 'Tahniah, anda telah mendapat 10 point pokok !';
    String halfmark = 'Tahniah, anda telah mendapat 5 point pokok !';
    String mark = 'Tahniah, anda telah mendapat 2 point pokok !';
    String cubalagi = 'cubalagi';
    String dahJawab = 'Point pokok hanya untuk percubaan pertama';

    if( question1answered == false){
      Provider.of<solatPoints>(context, listen: false).Question1answered();
      if(widget.correctNum == 10){
        Provider.of<solatPoints>(context, listen: false).FullpointPokok();
        return fullmark;
      }
      else if (widget.correctNum >= 5 && widget.correctNum != 10){
        Provider.of<solatPoints>(context, listen: false).HalfPointPokok();
        return halfmark;
      }
      else if (widget.correctNum < 5 && widget.correctNum != 0){
        Provider.of<solatPoints>(context, listen: false).increasePointPokok();
        return mark;
      }
      else{
        return cubalagi;
      }
    }
    else{
      return dahJawab;
    }
  }

  @override
  Widget build(BuildContext context) {
    QuestionController _qnController = Get.put(QuestionController());
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: GestureDetector(
          onTap: () {
            Get.to(() => bottomnavbar());
            Get.delete<QuestionController>();
          },
          child: Icon(
            Icons.home,
            size: 45,
          ),

        ),
        backgroundColor: Colors.deepPurple[900],
        elevation: 0.0,

      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          // SvgPicture.asset("assets/icons/bg.svg", fit: BoxFit.fill),
          Column(
            children: [
              Spacer(),
              Text(
                "Score",
                style: Theme.of(context)
                    .textTheme
                    .headline4,
                selectionColor:  Color(0xFF8B94BC),
              ),
              Spacer(),
              Text(
                "${widget.correctNum  * 10}/${_qnController.questions.length * 10}",
                style: Theme.of(context)
                    .textTheme
                    .headline4,
                 selectionColor:  Color(0xFF8B94BC),
              ),
              Spacer(),
              Text(
                "${scoreconverter()}",
                style: Theme.of(context)
                    .textTheme
                    .headline6,
                selectionColor:  Color(0xFF8B94BC),
              ),
            ],
          )
        ],
      ),
    );
  }
}