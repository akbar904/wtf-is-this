
import 'package:equatable/equatable.dart';

abstract class HomeState extends Equatable {
	const HomeState();

	@override
	List<Object> get props => [];
}

class HomeInitial extends HomeState {
	@override
	String toString() => 'HomeInitial';
}

class HomeLoaded extends HomeState {
	final List<String> items;

	const HomeLoaded(this.items);

	@override
	List<Object> get props => [items];

	@override
	String toString() => 'HomeLoaded(items: $items)';
}

class HomeError extends HomeState {
	final String errorMessage;

	const HomeError(this.errorMessage);

	@override
	List<Object> get props => [errorMessage];

	@override
	String toString() => 'HomeError(errorMessage: $errorMessage)';
}
