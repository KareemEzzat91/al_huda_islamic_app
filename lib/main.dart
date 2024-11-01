import 'package:al_huda_islamic_app/Screens/SplashScreen/SplashScreen.dart';
import 'package:al_huda_islamic_app/Tasks/JsonTask/TaskCubit/tasks_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Helpers/Diohelper/Diohelper.dart';
import 'Screens/HomeScreen/HomePage.dart';

void main() {
  Diohelper.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  @override
  Widget build(BuildContext context) {

    return  MultiBlocProvider(
      providers: [

        BlocProvider(create: (context) => TasksCubit()),
      ],

      child: MaterialApp(
        navigatorKey: navigatorKey, // Assign the navigator key
        initialRoute: '/splash',
        routes: {
          '/splash': (context) => Splashscreen(),
          '/home': (context) => HomePage(),
          // Add more routes here
        },    ),
    );
  }
}
