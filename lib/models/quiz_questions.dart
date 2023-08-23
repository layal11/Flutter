//we can create multiple contructors

class QuizQuestions {
  const QuizQuestions ({required this.text,required this.answers}); //named constructor 
  const QuizQuestions.helloNameless (this.text, this.answers); //positional constructors 
  
  final String text;
  final List<String> answers;

  List<String> getShuffledAnswers(){
    final shuffledList = List.of(answers); //create and store a copy of the original answers
    shuffledList.shuffle();
    return shuffledList;
  }
}