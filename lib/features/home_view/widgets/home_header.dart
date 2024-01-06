import 'dart:io';

import 'package:flutter/material.dart';
import 'package:seccion6/core/services/api_services.dart';

import 'package:seccion6/core/storage/local_storage.dart';
import 'package:seccion6/core/utils/colors.dart';
import 'package:seccion6/core/utils/styles.dart';

class homeHeader extends StatefulWidget {
  const homeHeader({super.key});

  @override
  State<homeHeader> createState() => _homeHeaderState();
}

class _homeHeaderState extends State<homeHeader> {
  String name = '';
  String? image;
  @override
  void initState() {
    super.initState();

    AppLocalStorage.getCachedData(AppLocalStorage.Name_Key).then((value) {
      setState(() {
        name = value;
      });
    });
    AppLocalStorage.getCachedData(AppLocalStorage.Image_Key).then((value) {
      setState(() {
        image = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text.rich(TextSpan(
              children: [
                TextSpan(
                  text: 'Hello, ',
                  style: getTitleStyle(color: AppColors.greyColor),
                ),
                TextSpan(
                  text: name,
                  style: getTitleStyle(color: AppColors.lemonadaColor),
                )
              ],
            )),
            Text(
              'Have a nice day',
              style: getBodyStyle(color: AppColors.greyColor),
            ),
          ],
        ),
        Spacer(),
        CircleAvatar(
            radius: 28,
            backgroundImage: image != null
                ? FileImage(File(image!)) as ImageProvider
                : AssetImage('assets/user.png')),
      ],
    );
  }
}
