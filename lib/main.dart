import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/appcubit.dart';
import 'package:news_app/cubit/appstate.dart';
import 'package:news_app/screens/homepage.dart';
import 'package:news_app/sharead/network/dio_helper.dart';

import 'blocobserver.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
  Bloc.observer = MyBlocObserver();
  await DioHelper.init();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => AppCubit()..getbussiness(),
        child: BlocConsumer<AppCubit, Appstate>(
          listener: (BuildContext context, state) {},
          builder: (BuildContext context, Object? state) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'News app',
              theme: ThemeData(
                scaffoldBackgroundColor: Colors.white,
                textTheme: const TextTheme(
                    bodyText1: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold)),
                primarySwatch: Colors.deepOrange,
                bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                    unselectedItemColor: Colors.black,
                    type: BottomNavigationBarType.fixed,
                    selectedItemColor: Colors.deepOrange,
                    backgroundColor: Colors.teal),
              ),
              home: HomePage(),
            );
          },
        ));
  }
}
