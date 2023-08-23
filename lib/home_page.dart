import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  const HomePage(this.startQuiz, {super.key});
  final void Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    Image image = Image.asset(
      'assets/images/quiz-logo.png',
      width: 200,
      color: Colors.white.withOpacity(0.7),
    );
    String text = 'Learn Flutter the fun way!';

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          image,
          const SizedBox(height: 40),
          Text(
            text,
            style: GoogleFonts.robotoMono(
              fontSize: 20,
              color: Colors.white.withOpacity(0.9),
            ),
          ),
          const SizedBox(height: 40),
          ElevatedButton.icon(
            onPressed: startQuiz,
            icon: const Icon(
              Icons.arrow_circle_right_outlined,
              color: Color.fromARGB(255, 250, 250, 119),
            ),
            label: const Text('Start Quiz'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.purple[300],
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              foregroundColor: Colors.yellow,
              textStyle: const TextStyle(fontSize: 15),
            ),
          ),
        ],
      ),
    );
  }
}
