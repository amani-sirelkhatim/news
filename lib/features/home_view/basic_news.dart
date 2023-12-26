import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:seccion6/features/home_view/widgets/home_header.dart';
import 'package:seccion6/features/home_view/widgets/image_slider.dart';
import 'package:seccion6/features/home_view/widgets/newsTapbar.dart';

class basicNews extends StatefulWidget {
  const basicNews({super.key});

  @override
  State<basicNews> createState() => _basicNewsState();
}

class _basicNewsState extends State<basicNews> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(20.0),
            child: homeHeader(),
          ),
          Gap(20),
          slider(),
          Gap(20),
          newsTapbar()
        ],
      ),
    );
  }
}
