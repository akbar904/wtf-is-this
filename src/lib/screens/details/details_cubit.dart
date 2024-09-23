
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:my_flutter_app/models/item_model.dart';
import 'package:my_flutter_app/screens/details/details_state.dart';

class DetailsCubit extends Cubit<DetailsState> {
	DetailsCubit() : super(DetailsInitial());

	Future<void> loadDetails(int itemId) async {
		try {
			// Simulate fetching item details. Replace with actual data fetching.
			await Future.delayed(Duration(seconds: 1));
			
			if (itemId <= 0) {
				throw Exception('Invalid item ID');
			}

			// Assume we have a method to fetch item by ID
			final item = ItemModel(id: itemId, name: 'Item $itemId', description: 'Description of item $itemId');
			
			emit(DetailsLoaded(item: item));
		} catch (e) {
			emit(DetailsError(message: 'Error loading details: ${e.toString()}'));
		}
	}
}
