
import 'package:flutter_test/flutter_test.dart';
import 'package:my_flutter_app/models/item_model.dart';

void main() {
	group('ItemModel', () {
		test('should be able to create an instance of ItemModel', () {
			final item = ItemModel(id: 1, name: 'Item 1', description: 'Description 1');
			expect(item, isA<ItemModel>());
			expect(item.id, 1);
			expect(item.name, 'Item 1');
			expect(item.description, 'Description 1');
		});

		test('should be able to serialize to JSON', () {
			final item = ItemModel(id: 1, name: 'Item 1', description: 'Description 1');
			final json = item.toJson();
			expect(json, isA<Map<String, dynamic>>());
			expect(json['id'], 1);
			expect(json['name'], 'Item 1');
			expect(json['description'], 'Description 1');
		});

		test('should be able to deserialize from JSON', () {
			final json = {'id': 1, 'name': 'Item 1', 'description': 'Description 1'};
			final item = ItemModel.fromJson(json);
			expect(item, isA<ItemModel>());
			expect(item.id, 1);
			expect(item.name, 'Item 1');
			expect(item.description, 'Description 1');
		});

		test('should support value equality', () {
			final item1 = ItemModel(id: 1, name: 'Item 1', description: 'Description 1');
			final item2 = ItemModel(id: 1, name: 'Item 1', description: 'Description 1');
			final item3 = ItemModel(id: 2, name: 'Item 2', description: 'Description 2');

			expect(item1, equals(item2));
			expect(item1, isNot(equals(item3)));
		});
	});
}
