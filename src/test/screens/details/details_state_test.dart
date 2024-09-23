
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:my_flutter_app/screens/details/details_state.dart';

void main() {
	group('DetailsState', () {
		group('DetailsInitial', () {
			test('supports value equality', () {
				expect(DetailsInitial(), equals(DetailsInitial()));
			});
			
			test('props are correct', () {
				expect(DetailsInitial().props, []);
			});
		});

		group('DetailsLoaded', () {
			const itemDetails = 'Sample Item Details';

			test('supports value equality', () {
				expect(
					DetailsLoaded(itemDetails: itemDetails), 
					equals(DetailsLoaded(itemDetails: itemDetails))
				);
			});
			
			test('props are correct', () {
				expect(DetailsLoaded(itemDetails: itemDetails).props, [itemDetails]);
			});
		});

		group('DetailsError', () {
			const errorMessage = 'Error loading details';

			test('supports value equality', () {
				expect(
					DetailsError(errorMessage: errorMessage), 
					equals(DetailsError(errorMessage: errorMessage))
				);
			});
			
			test('props are correct', () {
				expect(DetailsError(errorMessage: errorMessage).props, [errorMessage]);
			});
		});
	});
}
