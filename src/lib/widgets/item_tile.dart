
import 'package:flutter/material.dart';
import '../models/item_model.dart';

class ItemTile extends StatelessWidget {
	final ItemModel item;

	const ItemTile({Key? key, required this.item}) : super(key: key);

	@override
	Widget build(BuildContext context) {
		return ListTile(
			title: Text(item.name),
			subtitle: Text(item.description),
		);
	}
}
