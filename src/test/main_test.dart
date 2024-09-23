
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:my_flutter_app/main.dart';

void main() {
	group('Main App Tests', () {
		testWidgets('App should display HomeScreen initially', (WidgetTester tester) async {
			await tester.pumpWidget(MyApp());

			expect(find.text('Home Screen'), findsOneWidget);
		});
	});
}
