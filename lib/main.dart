import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterstaj/cubit/home_page_cubit.dart';
import 'package:flutterstaj/cubit/mark_cubit.dart';
import 'package:flutterstaj/cubit/page_two_cubit.dart';
import 'package:flutterstaj/entity/weather.dart';
import 'package:flutterstaj/pages/splash_screen.dart';
import 'package:flutterstaj/repo/weather_dao.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => MarkCubit()),
        BlocProvider(create: (context) => HomePageCubit()),
        BlocProvider(create: (context) => PageTwoCubit())
      ],
      child: MaterialApp(
        title: 'Mezun Takip Sistemi',
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        debugShowCheckedModeBanner: false,
        home: const SplashScreen(),
      ),
    );
  }
}
