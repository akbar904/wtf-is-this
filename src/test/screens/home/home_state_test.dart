
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:my_flutter_app/screens/home/home_state.dart';

void main() {
	group('HomeState', () {
		test('supports value comparisons', () {
			expect(HomeInitial(), HomeInitial());
			expect(HomeLoaded([]), HomeLoaded([]));
			expect(HomeError('error'), HomeError('error'));
		});
	});

	group('HomeInitial', () {
		test('toString returns correct value', () {
			expect(HomeInitial().toString(), 'HomeInitial');
		});
	});

	group('HomeLoaded', () {
		test('toString returns correct value', () {
			final items = ['item1', 'item2'];
			expect(HomeLoaded(items).toString(), 'HomeLoaded(items: $items)');
		});
	});

	group('HomeError', () {
		test('toString returns correct value', () {
			final errorMessage = 'An error occurred';
			expect(HomeError(errorMessage).toString(), 'HomeError(errorMessage: $errorMessage)');
		});
	});
}
