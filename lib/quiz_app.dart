import 'package:cspsc_hacks/screens/question_screen.dart';
import 'package:cspsc_hacks/screens/video_screen.dart';
import 'package:flutter/material.dart';

class QuizApp extends StatefulWidget {
  @override
  _QuizAppState createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  bool isVideoPhase = true;
  bool isSecondVideo = false; // Track if it's the second video

  void startQuiz() {
    setState(() {
      isVideoPhase = false; // Switch to the question screen
    });
  }

  void onQuizComplete() {
    setState(() {
      if (isSecondVideo) {
        // All quizzes complete, you can add an end screen here
      } else {
        isSecondVideo = true;
        isVideoPhase = true; // Play second video
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isVideoPhase
          ? VideoScreen(
              startQuiz: startQuiz,
              isSecondVideo: isSecondVideo,
            )
          : QuestionScreen(
              onQuizComplete: onQuizComplete,
              isSecondSet: isSecondVideo,
              chooseAnswer: (String) {},
            ),
    );
  }
}
