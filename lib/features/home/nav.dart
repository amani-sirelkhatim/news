import 'package:bottom_bar_matu/bottom_bar/bottom_bar_bubble.dart';
import 'package:bottom_bar_matu/bottom_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:seccion6/core/utils/colors.dart';

import 'package:seccion6/features/home_view/basic_news.dart';
import 'package:seccion6/features/profile/profile.dart';
import 'package:seccion6/features/search/search.dart';
import 'package:seccion6/features/source/source.dart';


class homeView extends StatefulWidget {
  const homeView({super.key});

  @override
  State<homeView> createState() => _homeViewState();
}

class _homeViewState extends State<homeView> {
  int currentindex = 0;
  List<Widget> screens = [
    const basicNews(),
    const search(),
    const source(),
    const profile()
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: screens[currentindex],
        ),
        bottomNavigationBar: BottomBarBubble(
          selectedIndex: currentindex,
          onSelect: (index) {
            setState(() {
              currentindex = index;
            });
          },
          backgroundColor: AppColors.scaffoldBg,
          items: [
            BottomBarItem(iconData: Icons.home_filled),
            BottomBarItem(iconData: Icons.search_rounded),
            BottomBarItem(iconData: Icons.folder),
            BottomBarItem(iconData: Icons.person),
          ],
        ),
      ),
    );
  }
}
