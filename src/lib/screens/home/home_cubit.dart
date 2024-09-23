
import 'package:bloc/bloc.dart';
import 'package:my_flutter_app/screens/home/home_state.dart';
import 'package:my_flutter_app/models/item_model.dart';

class HomeCubit extends Cubit<HomeState> {
	HomeCubit() : super(HomeInitial());

	void loadItems() async {
		try {
			// This is where you'd typically make a network request or database query.
			// For the sake of this example, we're using a static list of items.
			await Future.delayed(Duration(seconds: 1)); // Simulate network delay
			final items = [
				ItemModel(id: 1, name: 'Item 1', description: 'Description 1'),
				ItemModel(id: 2, name: 'Item 2', description: 'Description 2'),
				ItemModel(id: 3, name: 'Item 3', description: 'Description 3'),
			];
			emit(HomeLoaded(items));
		} catch (e) {
			emit(HomeError('Failed to load items'));
		}
	}
}
