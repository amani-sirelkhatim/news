import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

import 'package:seccion6/features/news/cubit/news_cubit.dart';
import 'package:seccion6/splash_view.dart';
import 'package:seccion6/core/utils/colors.dart';
import 'package:seccion6/core/utils/styles.dart';
import 'package:seccion6/splash_view.dart';

void main() async {
  await Hive.initFlutter();

  await Hive.openBox('user');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => newsCubit(),
      child: MaterialApp(
        theme: ThemeData(
            scaffoldBackgroundColor: AppColors.scaffoldBg,
            appBarTheme: AppBarTheme(
                centerTitle: true,
                titleTextStyle: getBodyStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: AppColors.lemonadaColor),
                backgroundColor: AppColors.scaffoldBg,
                elevation: 0.0),
            inputDecorationTheme: InputDecorationTheme(
              hintStyle: const TextStyle(color: Colors.grey),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(color: AppColors.lemonadaColor)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(color: AppColors.lemonadaColor)),
              errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(color: AppColors.redColor)),
              focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(color: AppColors.redColor)),
            )),
        debugShowCheckedModeBanner: false,
        home: splash(),
      ),
    );
  }
}
