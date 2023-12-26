import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:lottie/lottie.dart';
import 'package:seccion6/core/storage/local_storage.dart';
import 'package:seccion6/core/utils/colors.dart';
import 'package:seccion6/core/utils/styles.dart';
import 'package:seccion6/features/home/nav.dart';
import 'package:seccion6/features/upload/upload_view.dart';

class splash extends StatefulWidget {
  const splash({super.key});

  @override
  State<splash> createState() => _splashState();
}

class _splashState extends State<splash> {
  bool? isUpload;
  @override
  void initState() {
    super.initState();
    AppLocalStorage.getCachedData(AppLocalStorage.Is_uplouded).then((value) {
      isUpload = value ?? false;
    });
    Future.delayed(Duration(seconds: 5), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) =>
              isUpload! ? const homeView() : const UploadView()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Lottie.asset(
            'assets/logo.json',
            width: 250,
          ),
          Gap(10),
          Text(
            'Insight News',
            style: getTitleStyle(color: AppColors.greyColor),
          ),
          Gap(10),
          Text('it\'s time to get organized',
              style: getBodyStyle(color: AppColors.greyColor)),
        ],
      )),
    );
  }
}
