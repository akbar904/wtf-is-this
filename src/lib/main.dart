
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'screens/home/home_screen.dart';
import 'screens/details/details_screen.dart';

void main() {
	runApp(MyApp());
}

class MyApp extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		return MaterialApp(
			title: 'My Flutter App',
			theme: ThemeData(
				primarySwatch: Colors.blue,
			),
			initialRoute: '/',
			routes: {
				'/': (context) => BlocProvider(
					create: (context) => HomeCubit(),
					child: HomeScreen(),
				),
				'/details': (context) => BlocProvider(
					create: (context) => DetailsCubit(),
					child: DetailsScreen(),
				),
			},
		);
	}
}
