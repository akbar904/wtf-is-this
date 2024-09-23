
import 'package:flutter_test/flutter_test.dart';
import 'package:my_flutter_app/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:my_flutter_app/screens/home/home_cubit.dart';
import 'package:my_flutter_app/screens/home/home_state.dart';

// Mock HomeCubit
class MockHomeCubit extends MockCubit<HomeState> implements HomeCubit {}

void main() {
	group('HomeScreen Widget Tests', () {
		testWidgets('should display loading indicator when state is HomeInitial', (WidgetTester tester) async {
			// Arrange
			final mockHomeCubit = MockHomeCubit();
			when(() => mockHomeCubit.state).thenReturn(HomeInitial());

			// Act
			await tester.pumpWidget(
				MaterialApp(
					home: BlocProvider<HomeCubit>(
						create: (_) => mockHomeCubit,
						child: HomeScreen(),
					),
				),
			);

			// Assert
			expect(find.byType(CircularProgressIndicator), findsOneWidget);
		});

		testWidgets('should display list of items when state is HomeLoaded', (WidgetTester tester) async {
			// Arrange
			final mockHomeCubit = MockHomeCubit();
			final items = [
				ItemModel(id: 1, name: 'Item 1', description: 'Description 1'),
				ItemModel(id: 2, name: 'Item 2', description: 'Description 2'),
			];
			when(() => mockHomeCubit.state).thenReturn(HomeLoaded(items));

			// Act
			await tester.pumpWidget(
				MaterialApp(
					home: BlocProvider<HomeCubit>(
						create: (_) => mockHomeCubit,
						child: HomeScreen(),
					),
				),
			);

			// Assert
			expect(find.byType(ItemTile), findsNWidgets(items.length));
			expect(find.text('Item 1'), findsOneWidget);
			expect(find.text('Item 2'), findsOneWidget);
		});

		testWidgets('should display error message when state is HomeError', (WidgetTester tester) async {
			// Arrange
			final mockHomeCubit = MockHomeCubit();
			when(() => mockHomeCubit.state).thenReturn(HomeError('Failed to load items'));

			// Act
			await tester.pumpWidget(
				MaterialApp(
					home: BlocProvider<HomeCubit>(
						create: (_) => mockHomeCubit,
						child: HomeScreen(),
					),
				),
			);

			// Assert
			expect(find.text('Failed to load items'), findsOneWidget);
		});
	});
}
