import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:test_task_for_work/json/jsonToDart.dart';
import 'package:test_task_for_work/screens/quiz.dart';



class StartPage extends StatefulWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  StartPageState createState() => StartPageState();
}

class StartPageState extends State<StartPage> {

  final List<String> theme =[
    'Linux',
    'DevOps',
    'Docker',
    'SQL',
    'Code'
  ];
  final List<String> difficult = [
    'Easy',
    'Medium',
    'Hard'
  ];
  List<QuestionToDart> questionsList =[];
  String currentChooseForTheme ='Docker';
  String currentChooseForDifficult = 'Easy';
  DateTime currentDateTime = DateTime.now();


  @override
  Widget build(BuildContext context) {
    String time = '${currentDateTime.hour}:${currentDateTime.minute}:${currentDateTime.minute}';
    String date = '${currentDateTime.day}.${currentDateTime.month}.${currentDateTime.year}';

    return Scaffold(
      body: Column(
        children: [
          Padding(padding: EdgeInsets.only(top: 0.2*MediaQuery.of(context).size.height)),
          const Center(
            child: Text(
                'Choose category of a quiz'
            ),
          ),
          DropdownButton(
            items: theme.map((String dropDownItem){
              return DropdownMenuItem(
                value: dropDownItem,
                child: Text(dropDownItem),
              );
            }
            ).toList(),
            onChanged: (String? value){
              setState(() {
                currentChooseForTheme = value!;
              });
            },
            value: currentChooseForTheme,

          ),
          Padding(padding: EdgeInsets.only(top: 0.1*MediaQuery.of(context).size.height)),
          const Center(
              child: Text('Choose difficult of a quiz')
          ),
          DropdownButton(
            items: difficult.map((String dropDownItem){
              return DropdownMenuItem(
                value: dropDownItem,
                child: Text(dropDownItem),
              );
            }
            ).toList(),
            onChanged: (String? value){
              setState(() {
                currentChooseForDifficult = value!;
              });
            },
            value: currentChooseForDifficult,
          ),
          Padding(padding: EdgeInsets.only(top: 0.1*MediaQuery.of(context).size.height)),
          InkWell(
            onTap: () async{
              Uri url = Uri.parse('https://quizapi.io/api/v1/questions?apiKey=j24WhINsXuMG7PszLmbkLHqRiXRoFnjRZrHxkwDa&category=$currentChooseForTheme&limit=10&difficult=$currentChooseForDifficult');
              var response = await http.get(url);


              setState(()  {
                questionsList = questionToDartFromJson(response.body);
              });
              questionsList.isEmpty?
              null
                  :Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => QuizScreen(questionList: questionsList,date: date,time: time,)));



            },
            child: Container(
              height: 0.07*MediaQuery.of(context).size.height,
              width: 0.8*MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Center(
                  child: Text(
                    'Start quiz',
                    style: TextStyle(
                        color: Colors.white
                    ),
                  )
              ),
            ),
          ),
        ],
      ),
    );
  }

}