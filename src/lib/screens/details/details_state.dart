
import 'package:equatable/equatable.dart';

abstract class DetailsState extends Equatable {
	const DetailsState();

	@override
	List<Object?> get props => [];
}

class DetailsInitial extends DetailsState {
	const DetailsInitial();
}

class DetailsLoaded extends DetailsState {
	final String itemDetails;

	const DetailsLoaded({required this.itemDetails});

	@override
	List<Object?> get props => [itemDetails];
}

class DetailsError extends DetailsState {
	final String errorMessage;

	const DetailsError({required this.errorMessage});

	@override
	List<Object?> get props => [errorMessage];
}
