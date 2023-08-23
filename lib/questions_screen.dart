import 'package:first_flutter_app/answer_button.dart';
import 'package:flutter/material.dart';
import 'package:first_flutter_app/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key, required this.onSelectAnswer});

  final void Function(String answer) onSelectAnswer;

  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  var currentQuestionIndex = 0;

  void answerQuestion(selectedAnswers) {
    //used as a value for onTap
    widget.onSelectAnswer(selectedAnswers);
    setState(() {
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentQuestionIndex];

    return Center(
      child: Container(
        padding: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.text,
              style: GoogleFonts.robotoMono(
                fontSize: 17,
                color: const Color.fromARGB(255, 196, 144, 252),
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 15,
            ),
            ...currentQuestion.getShuffledAnswers().map((answerData) {
              return AnswerButton(
                answerText: answerData,
                onTap: () {
                  answerQuestion(answerData);
                },
              );
            }),
          ],
        ),
      ),
    );
  }
}



// var widgets = questions.map((questionData) {
//   return Column(
//     mainAxisAlignment: MainAxisAlignment.center,
//     children: [
//       Text(questionData.text),
//       const SizedBox(
//         height: 15,
//       ),
//       ...questionData.answers.map(
//         (answerData) {
//           return AnswerButton(answerText: answerData, onTap: () {});
//         },
//       ),
//     ],
//   );
// });