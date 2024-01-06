// import 'dart:html';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';
import 'package:seccion6/core/functions/functions.dart';
import 'package:seccion6/core/storage/local_storage.dart';
import 'package:seccion6/core/utils/colors.dart';
import 'package:seccion6/core/utils/styles.dart';
import 'package:seccion6/core/widgets/custom_button.dart';
import 'package:seccion6/features/home/nav.dart';
// import 'package:seccion6/features/home/home_view.dart';

class UploadView extends StatefulWidget {
  const UploadView({super.key});

  @override
  State<UploadView> createState() => _UploadViewState();
}

class _UploadViewState extends State<UploadView> {
  String? imagepath;
  String name = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
              onPressed: () {
                if (imagepath != null && name.isNotEmpty) {
                  AppLocalStorage.cacheData(AppLocalStorage.Is_uplouded, true);
                  AppLocalStorage.cacheData(
                      AppLocalStorage.Image_Key, imagepath!);
                  AppLocalStorage.cacheData(AppLocalStorage.Name_Key, name);
                  pushWithReplacment(context, const homeView());
                } else if (imagepath != null && name.isEmpty) {
                  showErrorWidget(context, 'Please Enter Your Name');
                } else if (imagepath == null && name.isNotEmpty) {
                  showErrorWidget(context, 'Please Enter Your Image');
                } else {
                  showErrorWidget(
                      context, 'Please Enter Your Name and Your Image');
                }
              },
              child: Text(
                'Done',
                style: getBodyStyle(
                    color: AppColors.greyColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ))
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 80,
              backgroundImage: (imagepath != null)
                  ? FileImage(File(imagepath!)) as ImageProvider
                  : const AssetImage('assets/user.png'),
            ),
            Gap(20),
            CustomButton(
              onTap: () {
                UploadFromCamera();
              },
              text: 'Upload from Camers',
              width: 260,
            ),
            Gap(10),
            CustomButton(
              onTap: () {
                UploadFromGallery();
              },
              text: 'Upload from Gallery',
              width: 260,
            ),
            Gap(20),
            Divider(),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextFormField(
                style: getBodyStyle(color: AppColors.greyColor),
                onChanged: (value) {
                  setState(() {
                    name = value;
                  });
                  print(name);
                },
                decoration: InputDecoration(
                  hintText: 'Enter Your Name',
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  UploadFromCamera() async {
    var pickedimage = await ImagePicker().pickImage(source: ImageSource.camera);
    if (pickedimage != null) {
      setState(() {
        imagepath = pickedimage.path;
      });
    }
  }

  UploadFromGallery() async {
    var pickedimage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedimage != null) {
      setState(() {
        imagepath = pickedimage.path;
      });
    }
  }
}
