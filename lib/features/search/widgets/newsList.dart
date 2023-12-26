import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:seccion6/core/utils/colors.dart';
import 'package:seccion6/core/utils/styles.dart';
import 'package:svg_flutter/svg.dart';

class searchList extends StatefulWidget {
  const searchList({super.key});

  @override
  State<searchList> createState() => _searchListState();
}

class _searchListState extends State<searchList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (context, index) {
        return Container(
          height: 90,
          margin: const EdgeInsets.only(top: 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppColors.containerBg),
          child: Row(
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    'assets/players.jpg',
                    width: 130,
                    height: 90,
                    fit: BoxFit.cover,
                  )),
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'Man City stay perfect despite Rodri red against ForestMan City stay perfect despite Rodri red against Forest',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: getBodyStyle(
                          fontSize: 12, color: AppColors.whiteColor),
                    ),
                    Row(
                      children: [
                        SvgPicture.asset('assets/read.svg'),
                        const Gap(5),
                        Text(
                          'Read',
                          style: getSmallStyle(
                              fontSize: 10, color: AppColors.whiteColor),
                        )
                      ],
                    )
                  ],
                ),
              ))
            ],
          ),
        );
      },
    );
  }
}
