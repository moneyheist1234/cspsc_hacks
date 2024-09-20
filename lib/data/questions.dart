import '../models/quiz_question.dart';

final List<QuizQuestion> firstSetOfQuestions = [
  QuizQuestion(
    'What was Margaret doing when she received the scam email?',
    [
      'Shopping online',
      'Checking emails',
      'Watching a video',
      'Talking on the phone',
    ],
  ),
  QuizQuestion(
    'What did the scam email claim?',
    [
      'Her bank account was frozen',
      'She won a prize',
      'Her account had been compromised',
      'She needed to update her password',
    ],
  ),
  QuizQuestion(
    'What did Margaret do after receiving the email?',
    [
      'Deleted the email',
      'Called her bank',
      'Clicked on the link and entered her details',
      'Ignored the email',
    ],
  ),
  QuizQuestion(
    'What happened after Margaret entered her details?',
    [
      'She secured her account',
      'Her bank called her',
      'Her bank account was compromised',
      'She received a confirmation message',
    ],
  ),
  QuizQuestion(
    'What lesson can we learn from Margaret’s story?',
    [
      'Always click on suspicious links',
      'cautious fake emails asking for personal information',
      'Share your details with friends',
      'Ignore emails from your bank',
    ],
  ),
];

final List<QuizQuestion> secondSetOfQuestions = [
  QuizQuestion(
    'What was the first step Margaret took to stay safe?',
    [
      'She deleted her email account',
      'She noticed warning signs in the email',
      'She clicked the suspicious link',
      'She ignored the scam',
    ],
  ),
  QuizQuestion(
    'Which of the following is a sign of a scam email?',
    [
      'A familiar email address',
      'No urgent requests',
      'Strange email address and misspelled words',
      'A professional tone',
    ],
  ),
  QuizQuestion(
    'How did Margaret confirm the issue with her bank?',
    [
      'She clicked the link in the email',
      'She called the number in the email',
      'She used the official website to contact her bank',
      'She ignored the issue',
    ],
  ),
  QuizQuestion(
    'What is one safe practice Margaret follows now?',
    [
      'She opens every email immediately',
      'She only reads emails from strangers',
      'She never clicks on suspicious links',
      'She shares her password with family',
    ],
  ),
  QuizQuestion(
    'What can help you protect yourself from scams?',
    [
      'Responding quickly to every email',
      'Verifying email addresses, avoiding suspicious links',
      'Ignoring emails entirely',
      'Trusting all emails with your personal info',
    ],
  ),
];

// List of correct answers for both sets of questions
final List<String> correctAnswers = [
  'Checking emails',
  'Her account had been compromised',
  'Clicked on the link and entered her details',
  'Her bank account was compromised',
  'cautious with unsolicited emails asking for personal information',
  'She noticed warning signs in the email',
  'Strange email address and misspelled words',
  'She used the official website to contact her bank',
  'She never clicks on suspicious links',
  'Verifying email addresses, avoiding suspicious links',
];
