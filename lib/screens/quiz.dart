

import 'package:flutter/material.dart';
import 'package:test_task_for_work/screens/final.dart';
import 'package:test_task_for_work/json/jsonToDart.dart';


class QuizScreen extends StatefulWidget {
  const QuizScreen({Key? key, required this.questionList, required this.date, required this.time}) : super(key: key);

  final List<QuestionToDart> questionList;
  final String date;
  final String time;

  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int index = 0;
  int flagOfCorrectAnswer = 100;
  int countOfCorrectAnswers = 0;
  bool isAnswerC = false;
  bool isAnswerD = false;

  @override
  Widget build(BuildContext context) {
    List<QuestionToDart> questions = widget.questionList;

    questions[index].correctAnswers!.answerACorrect == 'true'? flagOfCorrectAnswer = 0 : null;
    questions[index].correctAnswers!.answerBCorrect == 'true'? flagOfCorrectAnswer = 1 : null;
    questions[index].correctAnswers!.answerCCorrect == 'true'? flagOfCorrectAnswer = 2 : null;
    questions[index].correctAnswers!.answerDCorrect == 'true'? flagOfCorrectAnswer = 3 : null;

    questions[index].answers!.answerC == null? isAnswerC = false : isAnswerC = true;
    questions[index].answers!.answerD == null? isAnswerD = false : isAnswerD = true;

    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Padding(padding: EdgeInsets.only(top: 0.1*MediaQuery.of(context).size.height)),
            Container(
              width: 0.9*MediaQuery.of(context).size.width,
              height: 0.2*MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 0.05*MediaQuery.of(context).size.width),
                child: Center(
                  child: Text(
                      questions[index].question!,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                  ),
                ),
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 0.05*MediaQuery.of(context).size.height)),
            InkWell(
              onTap: (){
                flagOfCorrectAnswer == 0?
                setState(() {
                  countOfCorrectAnswers++;
                  index+1==questions.length?
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>FinalPage(correctAnswers: countOfCorrectAnswers, date: widget.date,time: widget.time,))):index++;
                }): setState(() {
                  index+1==questions.length?
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>FinalPage(correctAnswers: countOfCorrectAnswers,date: widget.date,time: widget.time,))):index++;
                });
              },
              child: answer(context, questions[index].answers!.answerA!),
            ),
            Padding(padding: EdgeInsets.only(top: 0.01*MediaQuery.of(context).size.height)),
            InkWell(
              onTap: (){
                flagOfCorrectAnswer == 1?
                setState(() {
                  countOfCorrectAnswers++;
                  index+1==questions.length?
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>FinalPage(correctAnswers: countOfCorrectAnswers,date: widget.date,time: widget.time,))):index++;
                }): setState(() {
                  index+1==questions.length?
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>FinalPage(correctAnswers: countOfCorrectAnswers,date: widget.date,time: widget.time,))):index++;
                });
              },
              child: answer(context, questions[index].answers!.answerB!)
            ),
            Padding(padding: EdgeInsets.only(top: 0.01*MediaQuery.of(context).size.height)),
            isAnswerC?
            InkWell(
              onTap: (){
                flagOfCorrectAnswer == 2?
                setState(() {
                  countOfCorrectAnswers++;
                  index+1==questions.length?
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>FinalPage(correctAnswers: countOfCorrectAnswers,date: widget.date,time: widget.time,)))
                      : index++;
                }): setState(() {
                  index+1==questions.length?
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>FinalPage(correctAnswers: countOfCorrectAnswers,date: widget.date,time: widget.time,)))
                      :index++;
                });
              },
              child: answer(context, questions[index].answers!.answerC!)
            ): Container(),
            Padding(padding: EdgeInsets.only(top: 0.01*MediaQuery.of(context).size.height)),
            isAnswerD?
            InkWell(
              onTap: (){
                flagOfCorrectAnswer == 3?
                setState(() {
                  countOfCorrectAnswers++;
                  index+1==questions.length?
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>FinalPage(correctAnswers: countOfCorrectAnswers,date: widget.date,time: widget.time,)))
                      : index++;
                }): setState(() {
                  index+1==questions.length?
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>FinalPage(correctAnswers: countOfCorrectAnswers,date: widget.date,time: widget.time,))):index++;
                });
              },
              child: answer(context, questions[index].answers!.answerD!)
            ):Container(),
            Padding(padding: EdgeInsets.only(top: 0.05*MediaQuery.of(context).size.height)),
            Expanded(child: Container()),
            InkWell(
              onTap: (){
                index+1 == questions.length?
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>FinalPage(correctAnswers: countOfCorrectAnswers,date: widget.date,time: widget.time,)))
                    :
                setState(() {
                  index++;
                });
              },
              child: Container(
                width: 0.9*MediaQuery.of(context).size.width,
                height: 0.07*MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 0.05*MediaQuery.of(context).size.width),
                    child:Text(
                      index+1 ==questions.length? 'End quiz' :'Next question',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


Widget answer(BuildContext context, String answer){
  return Container(
    width: 0.9*MediaQuery.of(context).size.width,
    height: 0.1*MediaQuery.of(context).size.height,
    decoration: BoxDecoration(
      color: Colors.black,
      borderRadius: BorderRadius.circular(16),
    ),
    child: Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 0.05*MediaQuery.of(context).size.width),
        child: Text(
          answer,
          style:const TextStyle(
            color: Colors.white,
            fontSize: 12,

          ),
        ),
      ),
    ),
  );
}