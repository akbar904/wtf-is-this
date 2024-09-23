
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:com.example.my_flutter_app/widgets/item_tile.dart';

void main() {
	group('ItemTile Widget Tests', () {
		testWidgets('should display item name and description', (WidgetTester tester) async {
			// Arrange
			const itemName = 'Test Item';
			const itemDescription = 'This is a test item description';
			const item = ItemModel(id: 1, name: itemName, description: itemDescription);

			// Act
			await tester.pumpWidget(
				MaterialApp(
					home: Scaffold(
						body: ItemTile(item: item),
					),
				),
			);

			// Assert
			expect(find.text(itemName), findsOneWidget);
			expect(find.text(itemDescription), findsOneWidget);
		});

		testWidgets('should have a ListTile with correct title and subtitle', (WidgetTester tester) async {
			// Arrange
			const itemName = 'Test Item';
			const itemDescription = 'This is a test item description';
			const item = ItemModel(id: 1, name: itemName, description: itemDescription);

			// Act
			await tester.pumpWidget(
				MaterialApp(
					home: Scaffold(
						body: ItemTile(item: item),
					),
				),
			);

			// Assert
			final listTileFinder = find.byType(ListTile);
			expect(listTileFinder, findsOneWidget);

			final listTile = tester.widget<ListTile>(listTileFinder);
			expect(listTile.title, isA<Text>());
			expect((listTile.title as Text).data, itemName);
			expect(listTile.subtitle, isA<Text>());
			expect((listTile.subtitle as Text).data, itemDescription);
		});
	});
}
