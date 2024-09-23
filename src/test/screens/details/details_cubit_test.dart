
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:my_flutter_app/screens/details/details_cubit.dart';
import 'package:my_flutter_app/screens/details/details_state.dart';
import 'package:my_flutter_app/models/item_model.dart';

// Mock for ItemModel (if needed)
class MockItemModel extends Mock implements ItemModel {}

void main() {
	group('DetailsCubit', () {
		late DetailsCubit detailsCubit;

		setUp(() {
			detailsCubit = DetailsCubit();
		});

		tearDown(() {
			detailsCubit.close();
		});

		blocTest<DetailsCubit, DetailsState>(
			'emits [DetailsInitial] when instantiated',
			build: () => detailsCubit,
			expect: () => [DetailsInitial()],
		);

		blocTest<DetailsCubit, DetailsState>(
			'emits [DetailsLoaded] when loadDetails is called with valid itemId',
			build: () => detailsCubit,
			act: (cubit) => cubit.loadDetails(1),
			expect: () => [
				isA<DetailsLoaded>().having((state) => state.item.id, 'id', 1),
			],
		);

		blocTest<DetailsCubit, DetailsState>(
			'emits [DetailsError] when loadDetails is called with invalid itemId',
			build: () => detailsCubit,
			act: (cubit) => cubit.loadDetails(-1), // Assuming -1 is invalid
			expect: () => [
				isA<DetailsError>().having((state) => state.message, 'message', contains('Error')),
			],
		);
	});
}
