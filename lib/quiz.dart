//QuizState is the main widget we use for starting our overall UI

import 'package:first_flutter_app/data/questions.dart';
import 'package:first_flutter_app/home_page.dart';
import 'package:first_flutter_app/questions_screen.dart';
import 'package:first_flutter_app/results_screen.dart';
import 'package:flutter/material.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

//Solution 1
class _QuizState extends State<Quiz> {
  List<String> selectedAnswers = [];
  var activeScreen = 'home-screen';

  void switchScreen() {
    setState(() {
      activeScreen = 'questions-screen';
    });
  }

  //we have to pass this function to questions_screen by accepting it in it in questions_screen as parameter
  void chooseAnswers(String answer) {
    selectedAnswers.add(answer);
    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = 'results-screen';
      });
    }
  }

  void retartBtn() {
    setState(() {
      activeScreen = 'questions-screen';
        selectedAnswers = [];
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget screenWidget = HomePage(switchScreen);
    if (activeScreen == 'questions-screen') {
      screenWidget = QuestionsScreen(
        onSelectAnswer: chooseAnswers,
      );
    }
    if (activeScreen == 'results-screen') {
      screenWidget = ResultsScreen(
        chosenAnswers: selectedAnswers,
        restartQuizBtn: retartBtn,
      );
    }

    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.purple,
        body: Container(
          child: screenWidget,
        ),
      ),
    );
  }
}

//Solution 2
// class _QuizState extends State<QuizState> {
//   Widget?
//       activeScreen; // ? tells dart that the variable may contain a widget OR null
//   @override
//   void initState() {
//     //this will execute before the build method runs so that active screen will be set to the right value when build method executes
//     activeScreen = HomePage(switchScreen);
//     super.initState();
//   }

//   void switchScreen() {
//     setState(() {
//       activeScreen = const QuestionsScreen();
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         backgroundColor: Colors.purple,
//         body: Container(
//           child: activeScreen,
//         ),
//       ),
//     );
//   }
// }