import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/answer_button.dart';
import '../data/questions.dart';

class QuestionScreen extends StatefulWidget {
  final Function onQuizComplete;
  final bool isSecondSet;
  final Function(String) chooseAnswer;

  const QuestionScreen({
    super.key,
    required this.onQuizComplete,
    required this.isSecondSet,
    required this.chooseAnswer,
  });

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  var currentQuestionIndex = 0;
  String? selectedAnswer;

  void answerQuestion(String answer) {
    setState(() {
      selectedAnswer = answer;

      Future.delayed(const Duration(seconds: 1), () {
        setState(() {
          currentQuestionIndex++;
          selectedAnswer = null;

          if (currentQuestionIndex >=
              (widget.isSecondSet
                  ? secondSetOfQuestions.length
                  : firstSetOfQuestions.length)) {
            widget.onQuizComplete();
          }
        });
      });

      widget.chooseAnswer(answer);
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = widget.isSecondSet
        ? secondSetOfQuestions[currentQuestionIndex]
        : firstSetOfQuestions[currentQuestionIndex];

    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: Text(
                currentQuestion.text,
                style: GoogleFonts.lato(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 30),
            ...currentQuestion.answers.map((answer) {
              return AnswerButton(
                answerText: answer,
                onTap: selectedAnswer == null
                    ? () => answerQuestion(answer)
                    : null,
              );
            }).toList(),
          ],
        ),
      ),
    );
  }
}
