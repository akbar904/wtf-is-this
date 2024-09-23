
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_flutter_app/screens/details/details_cubit.dart';
import 'package:my_flutter_app/screens/details/details_state.dart';

class DetailsScreen extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBar(
				title: Text('Details'),
			),
			body: BlocBuilder<DetailsCubit, DetailsState>(
				builder: (context, state) {
					if (state is DetailsInitial) {
						return Center(
							child: CircularProgressIndicator(),
						);
					} else if (state is DetailsLoaded) {
						return Padding(
							padding: const EdgeInsets.all(16.0),
							child: Column(
								crossAxisAlignment: CrossAxisAlignment.start,
								children: [
									Text(
										state.itemName,
										style: Theme.of(context).textTheme.headline6,
									),
									SizedBox(height: 8),
									Text(
										state.itemDescription,
										style: Theme.of(context).textTheme.bodyText2,
									),
								],
							),
						);
					} else if (state is DetailsError) {
						return Center(
							child: Text(
								state.errorMessage,
								style: TextStyle(color: Colors.red),
							),
						);
					} else {
						return Container();
					}
				},
			),
		);
	}
}
