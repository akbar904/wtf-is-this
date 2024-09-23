
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'home_cubit.dart';
import 'home_state.dart';
import 'package:my_flutter_app/widgets/item_tile.dart';
import 'package:my_flutter_app/models/item_model.dart';

class HomeScreen extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBar(
				title: Text('Home Screen'),
			),
			body: BlocBuilder<HomeCubit, HomeState>(
				builder: (context, state) {
					if (state is HomeInitial) {
						return Center(child: CircularProgressIndicator());
					} else if (state is HomeLoaded) {
						return ListView.builder(
							itemCount: state.items.length,
							itemBuilder: (context, index) {
								return ItemTile(item: state.items[index]);
							},
						);
					} else if (state is HomeError) {
						return Center(child: Text(state.message));
					} else {
						return Center(child: Text('Unknown state'));
					}
				},
			),
		);
	}
}
