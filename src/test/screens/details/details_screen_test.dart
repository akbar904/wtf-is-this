
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:my_flutter_app/screens/details/details_screen.dart';
import 'package:my_flutter_app/screens/details/details_cubit.dart';
import 'package:my_flutter_app/screens/details/details_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Mock classes
class MockDetailsCubit extends MockCubit<DetailsState> implements DetailsCubit {}

void main() {
	group('DetailsScreen', () {
		late DetailsCubit detailsCubit;

		setUp(() {
			detailsCubit = MockDetailsCubit();
		});

		testWidgets('displays loading indicator when state is DetailsInitial', (WidgetTester tester) async {
			when(() => detailsCubit.state).thenReturn(DetailsInitial());

			await tester.pumpWidget(
				MaterialApp(
					home: BlocProvider.value(
						value: detailsCubit,
						child: DetailsScreen(),
					),
				),
			);

			expect(find.byType(CircularProgressIndicator), findsOneWidget);
		});

		testWidgets('displays details when state is DetailsLoaded', (WidgetTester tester) async {
			const itemName = 'Item Name';
			const itemDescription = 'Item Description';

			when(() => detailsCubit.state).thenReturn(DetailsLoaded(itemName, itemDescription));

			await tester.pumpWidget(
				MaterialApp(
					home: BlocProvider.value(
						value: detailsCubit,
						child: DetailsScreen(),
					),
				),
			);

			expect(find.text(itemName), findsOneWidget);
			expect(find.text(itemDescription), findsOneWidget);
		});

		testWidgets('displays error message when state is DetailsError', (WidgetTester tester) async {
			const errorMessage = 'Failed to load details';

			when(() => detailsCubit.state).thenReturn(DetailsError(errorMessage));

			await tester.pumpWidget(
				MaterialApp(
					home: BlocProvider.value(
						value: detailsCubit,
						child: DetailsScreen(),
					),
				),
			);

			expect(find.text(errorMessage), findsOneWidget);
		});
	});
}
