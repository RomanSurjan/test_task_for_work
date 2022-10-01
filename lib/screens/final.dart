import 'dart:developer';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:test_task_for_work/screens/home.dart';


class FinalPage extends StatefulWidget {
  const FinalPage({Key? key, required this.correctAnswers, required this.date, required this.time}) : super(key: key);

  final int correctAnswers;
  final String date;
  final String time;
  @override
  FinalPageState createState() => FinalPageState();
}

class FinalPageState extends State<FinalPage> {

  DatabaseReference reference = FirebaseDatabase.instance.ref();
  @override
  Widget build(BuildContext context) {
    String correctAnswers = widget.correctAnswers.toString();
    return Scaffold(
      body:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(child: Container()),
            Text('You get $correctAnswers correct answers from 10 questions'),
            Expanded(child: Container()),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                button(context, 'Restart', restartQuiz),
                button(context, 'Save', saveQuiz),
              ],
            ),
          ],
        ),
      ),
    );
  }
  void restartQuiz(){
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>const StartPage()));

  }
  void saveQuiz(){
    String date = widget.date;
    String time = widget.time;
    String correctAnswers =widget.correctAnswers.toString();

    Map<String, String> quiz ={
      'date':date,
      'time':time,
      'correctAnswers':correctAnswers,
    };
    reference.child('Quiz').push().set(quiz).then((value) {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>const StartPage()));
    });
  }

}
  Widget button(BuildContext context, String label, void Function() onTap){
    return  InkWell(
      onTap: onTap,
      child: Container(
        height: 0.1*MediaQuery.of(context).size.height,
        width: 0.45*MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Center(
          child: Text(
              label,
            style: TextStyle(
              color: Colors.white
            ),
          ),
        ),
      ),
    );
  }