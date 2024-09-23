
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:my_flutter_app/screens/home/home_cubit.dart';
import 'package:my_flutter_app/screens/home/home_state.dart';
import 'package:my_flutter_app/models/item_model.dart';

class MockHomeCubit extends MockCubit<HomeState> implements HomeCubit {}

void main() {
	group('HomeCubit', () {
		late HomeCubit homeCubit;

		setUp(() {
			homeCubit = HomeCubit();
		});

		tearDown(() {
			homeCubit.close();
		});

		test('initial state is HomeInitial', () {
			expect(homeCubit.state, HomeInitial());
		});

		blocTest<HomeCubit, HomeState>(
			'emits [HomeLoaded] when loadItems is successful',
			build: () => homeCubit,
			act: (cubit) => cubit.loadItems(),
			expect: () => [
				isA<HomeLoaded>(),
			],
		);

		blocTest<HomeCubit, HomeState>(
			'emits [HomeError] when loadItems fails',
			build: () => homeCubit,
			act: (cubit) {
				when(() => cubit.loadItems()).thenThrow(Exception('Failed to load items'));
				cubit.loadItems();
			},
			expect: () => [
				isA<HomeError>(),
			],
		);
	});
}
