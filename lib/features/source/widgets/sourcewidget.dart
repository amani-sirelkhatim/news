import 'package:flutter/material.dart';
import 'package:seccion6/core/functions/functions.dart';
import 'package:seccion6/core/utils/colors.dart';
import 'package:seccion6/core/utils/styles.dart';
import 'package:seccion6/features/source/sourcenews.dart';

class grid extends StatefulWidget {
  const grid({super.key, required this.image, required this.name});
  final String image;
  final String name;
  @override
  State<grid> createState() => _gridState();
}

class _gridState extends State<grid> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      decoration: BoxDecoration(
          color: AppColors.containerBg,
          borderRadius: BorderRadius.circular(15)),
      child: Column(
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(
                widget.image,
                height: 120,
                fit: BoxFit.fill,
              )),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  widget.name,
                  style:
                      getBodyStyle(fontSize: 16, color: AppColors.whiteColor),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
