import 'package:first_flutter_app/data/questions.dart';
import 'package:first_flutter_app/questions_summary.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen(
      {super.key, required this.chosenAnswers, required this.restartQuizBtn});
  final List<String> chosenAnswers;
  final void Function() restartQuizBtn;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = []; //course 81
    try {
      for (var i = 0; i < chosenAnswers.length; i++) {
        summary.add({
          'question_index': i,
          'question': questions[i].text,
          'correct_answer': questions[i].answers[0],
          'user_answer': chosenAnswers[i],
        });
      }
    } catch (ex) {
      print(ex);
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final numTotalQuestions = questions.length;
    final numCorrectQuestions = summaryData
        .where((data) {
          return data['user_answer'] == data['correct_answer'];
        })
        .length
        .toString();

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
              'You\'ve answered $numCorrectQuestions out of $numTotalQuestions questions correctly',
              style: GoogleFonts.robotoMono(
                fontSize: 20,
              )),
          const SizedBox(
            height: 30,
          ),
          QuestionsSummary(summaryData: summaryData),
          const SizedBox(
            height: 30,
          ),
          TextButton(
            onPressed: restartQuizBtn,
            child: const Text('Restart quiz'),
          ),
        ],
      ),
    );
  }
}
