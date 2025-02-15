// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rewardprocessing/questionnaire/my_slider.dart';
import 'package:rewardprocessing/questionnaire/questionnaire.dart';
import 'package:rewardprocessing/questionnaire/questionnaire16.dart';

void main() {
  testWidgets('Text field test', (tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MaterialApp(home: Questionnaire16(id: 'Test', day: 'Day1')));

    expect(find.text(''), findsOneWidget);

    await tester.enterText(find.byType(TextFormField), 'TestWidget');
    await tester.pumpAndSettle(const Duration(seconds: 2));

    expect(find.text('TestWidget'), findsOneWidget);
  });

  testWidgets('Slider test', (tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MaterialApp(home: Questionnaire(id: 'Test', day: 'Day1')));

    await tester.drag(find.byType(MySlider), const Offset(3, 0));
    await tester.pumpAndSettle(const Duration(seconds: 2));

  });
}