import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seccion6/core/utils/colors.dart';
import 'package:seccion6/core/utils/styles.dart';
import 'package:seccion6/features/home_view/widgets/newsListBuilder.dart';
import 'package:seccion6/features/news/cubit/news_cubit.dart';

class newsTapbar extends StatefulWidget {
  const newsTapbar({
    super.key,
  });

  @override
  State<newsTapbar> createState() => _newsTapbarState();
}

class _newsTapbarState extends State<newsTapbar> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Expanded(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(children: <Widget>[
            ButtonsTabBar(
              backgroundColor: AppColors.lemonadaColor,
              buttonMargin: const EdgeInsets.symmetric(horizontal: 10),
              contentPadding: const EdgeInsets.symmetric(horizontal: 15),
              unselectedBackgroundColor: AppColors.containerBg,
              unselectedLabelStyle: getBodyStyle(
                  fontSize: 10,
                  color: AppColors.whiteColor,
                  fontWeight: FontWeight.bold),
              labelStyle: getBodyStyle(
                  fontSize: 10,
                  color: AppColors.blackColor,
                  fontWeight: FontWeight.bold),
              tabs: [
                Tab(
                  text: "Science",
                ),
                Tab(
                  text: "Entertainment",
                ),
                Tab(
                  text: "Sports",
                ),
                Tab(
                  text: "Business",
                ),
              ],
            ),
            const Expanded(
              child: TabBarView(
                children: <Widget>[
                  Center(
                    child: newsList(category: 'science'),
                  ),
                  Center(
                    child: newsList(category: 'entertainment'),
                  ),
                  Center(
                    child: newsList(category: 'sports'),
                  ),
                  Center(
                    child: newsList(category: 'business'),
                  ),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
