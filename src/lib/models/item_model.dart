
import 'package:equatable/equatable.dart';

class ItemModel extends Equatable {
	final int id;
	final String name;
	final String description;

	ItemModel({
		required this.id,
		required this.name,
		required this.description,
	});

	@override
	List<Object> get props => [id, name, description];

	factory ItemModel.fromJson(Map<String, dynamic> json) {
		return ItemModel(
			id: json['id'],
			name: json['name'],
			description: json['description'],
		);
	}

	Map<String, dynamic> toJson() {
		return {
			'id': id,
			'name': name,
			'description': description,
		};
	}
}
