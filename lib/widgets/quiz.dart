import 'package:flutter/material.dart';
import '../screens/question_screen.dart';
import '../screens/start_screen.dart';
import '../screens/video_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  String activeScreen = 'start-screen'; // Track which screen is active
  bool isSecondVideo = false; // Track if we are showing the second video
  List<String> selectedAnswers = []; // Track user's selected answers

  // Correct answers list
  final List<String> correctAnswers = [
    'Checking emails',
    'Her account had been compromised',
    'Clicked on the link and entered her details',
    'Her bank account was compromised',
    'cautious fake emails asking for personal information',
    'She noticed warning signs in the email',
    'Strange email address and misspelled words',
    'She used the official website to contact her bank',
    'She never clicks on suspicious links',
    'Verifying email addresses, avoiding suspicious links',
  ];

  // Handle answer selection
  void chooseAnswer(String answer) {
    setState(() {
      selectedAnswers.add(answer);
    });
  }

  void startVideo() {
    setState(() {
      activeScreen = 'video-screen'; // Switch to the video screen
    });
  }

  void startQuiz() {
    setState(() {
      activeScreen = 'question-screen'; // Switch to the quiz screen
    });
  }

  // Handle quiz completion
  void onQuizComplete() {
    if (isSecondVideo) {
      // Compare the selected answers with correct ones
      int score = calculateScore();
      // Navigate to a results or complete screen
      showQuizComplete(score);
    } else {
      // Switch to the second video after the first quiz
      setState(() {
        isSecondVideo = true; // Move to second video
        activeScreen = 'video-screen'; // Go back to the video screen
      });
    }
  }

  // Calculate the score by comparing the selected answers to the correct ones
  int calculateScore() {
    int score = 0;
    for (int i = 0; i < selectedAnswers.length; i++) {
      if (selectedAnswers[i] == correctAnswers[i]) {
        score++;
      }
    }
    return score;
  }

  // Display the quiz completion message with the score
  void showQuizComplete(int score) {
    setState(() {
      activeScreen = 'quiz-complete';
    });
  }

  void restartQuiz() {
    setState(() {
      selectedAnswers.clear();
      activeScreen = 'start-screen';
      isSecondVideo = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0XFF284F91),
                Color(0XFF4072AF),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: activeScreen == 'start-screen'
              ? StartScreen(startVideo: startVideo)
              : activeScreen == 'video-screen'
                  ? VideoScreen(
                      startQuiz: startQuiz,
                      isSecondVideo: isSecondVideo,
                    )
                  : activeScreen == 'question-screen'
                      ? QuestionScreen(
                          onQuizComplete: onQuizComplete,
                          chooseAnswer: chooseAnswer, // Pass this function
                          isSecondSet: isSecondVideo,
                        )
                      : Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Your score: ${calculateScore()} out of 10',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 20),
                              ElevatedButton(
                                onPressed: restartQuiz,
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.black,
                                ),
                                child: const Text(
                                  'Start Again',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 10),
                            ],
                          ),
                        ),
        ),
      ),
    );
  }
}
