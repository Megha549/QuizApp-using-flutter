//import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:myapp/quiz_data.dart';

import 'package:myapp/main.dart'; // Import your main.dart

void main() {
  testWidgets('Quiz App Test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());
    await tester.pumpAndSettle();

    // Verify that the first question is displayed.
    expect(find.text(quizQuestions[0].question), findsOneWidget);

    // Verify that the options for the firsquestion are displayed.
    for (final option in quizQuestions[0].options) {
      expect(find.text(option), findsOneWidget);
    }

    // Tap the first answer and verify that we navigate to the next screen
    await tester.tap(
      find.text(quizQuestions[0].options[quizQuestions[0].correctAnswerIndex]),
    );
    await tester.pump();

    await tester.pumpAndSettle();

    // Verify that the second question is displayed.
    expect(find.text(quizQuestions[1].question), findsOneWidget);
  });
}
