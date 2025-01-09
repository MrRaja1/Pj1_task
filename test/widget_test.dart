// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:task/main.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that our counter starts at 0.
    expect(find.text('RIDES'), findsOneWidget);
    expect(find.text('STORIES'), findsOneWidget);
    expect(find.text('MARKET'), findsOneWidget);
    expect(find.text('GARAGE'), findsOneWidget);
    expect(find.text('Invite'), findsOneWidget);
    expect(find.text('Register Now'), findsOneWidget);
    expect(find.text('..... - .....INR'), findsOneWidget);
    
    expect(find.text('abc'), findsNothing);
    expect(find.byIcon(Icons.notifications), findsOne);
    expect(find.byIcon(Icons.image_outlined), findsOne);
    expect(find.byIcon(Icons.credit_card), findsOne);
    expect(find.byIcon(Icons.menu), findsOne);
    expect(find.byIcon(Icons.add_call), findsNothing);

    // Tap the '+' icon and trigger a frame.
    //await tester.tap(find.byIcon(Icons.add));
    await tester.tap(find.byIcon(Icons.notifications));
    await tester.tap(find.byIcon(Icons.image_outlined));
    await tester.tap(find.byIcon(Icons.credit_card));
    await tester.tap(find.byIcon(Icons.menu));
    await tester.pump();

    // Verify that our counter has incremented.
    // expect(find.text('0'), findsNothing);
    // expect(find.text('1'), findsOneWidget);

    expect(find.text('RIDES'), findsOneWidget);
    expect(find.text('STORIES'), findsOneWidget);
    expect(find.text('MARKET'), findsOneWidget);
    expect(find.text('GARAGE'), findsOneWidget);
    expect(find.text('Invite'), findsOneWidget);
    expect(find.text('Register Now'), findsOneWidget);
    expect(find.text('..... - .....INR'), findsOneWidget);

    expect(find.text('abc'), findsNothing);
    expect(find.byIcon(Icons.notifications), findsOne);
    expect(find.byIcon(Icons.image_outlined), findsOne);
    expect(find.byIcon(Icons.credit_card), findsOne);
    expect(find.byIcon(Icons.menu), findsOne);
    expect(find.byIcon(Icons.add_call), findsNothing);
  }
             );
}

