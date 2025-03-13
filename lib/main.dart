/*import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
*/
// This widget is the root of your application.
import 'package:flutter/material.dart';
import 'quiz_data.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: QuizScreen(),
    );
  }
}

class QuizScreen extends StatefulWidget {
  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int currentQuestionIndex = 0;
  int score = 0;

  void _checkAnswer(int selectedOptionIndex) {
    if (quizQuestions[currentQuestionIndex].correctAnswerIndex ==
        selectedOptionIndex) {
      setState(() {
        score += 1;
      });
    }

    setState(() {
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (currentQuestionIndex >= quizQuestions.length) {
      return Scaffold(
        appBar: AppBar(title: Text('Quiz Completed')),
        body: Center(
          child: Text('Your score is $score out of ${quizQuestions.length}'),
        ),
      );
    }

    final currentQuestion = quizQuestions[currentQuestionIndex];
    return Scaffold(
      appBar: AppBar(title: Text('Quiz App')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(currentQuestion.question),
          ...currentQuestion.options.asMap().entries.map((entry) {
            int idx = entry.key;
            String option = entry.value;
            return ElevatedButton(
              onPressed: () => _checkAnswer(idx),
              child: Text(option),
            );
          }).toList(),
        ],
      ),
    );
  }
}
