import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';
import 'package:seccion6/core/storage/local_storage.dart';
import 'package:seccion6/core/utils/colors.dart';
import 'package:seccion6/core/utils/styles.dart';
import 'package:seccion6/core/widgets/custom_button.dart';

class profile extends StatefulWidget {
  const profile({super.key});

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
  String name = '';
  String? image;
  var formkey = GlobalKey<FormState>();
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
    return Scaffold(
     
      body: Center(
          child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                CircleAvatar(
                  radius: 72,
                  backgroundColor: AppColors.whiteColor,
                  child: CircleAvatar(
                    radius: 70,
                    backgroundImage: (image != null)
                        ? FileImage(File(image!)) as ImageProvider
                        : const AssetImage('assets/user.png'),
                  ),
                ),
                CircleAvatar(
                  radius: 18,
                  backgroundColor: AppColors.blackColor,
                  child: IconButton(
                      onPressed: () {
                        showModalBottomSheet(
                            context: context,
                            builder: (BuildContext context) {
                              return SizedBox(
                                height: 250,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: AppColors.containerBg,
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: Column(
                                      children: [
                                        Gap(10),
                                        CustomButton(
                                          text: 'Upload from Camera',
                                          style: getTitleStyle(
                                              color: AppColors.blackColor),
                                          onTap: () {
                                            UploadFromCamera();
                                          },
                                          width: double.infinity,
                                        ),
                                        Gap(10),
                                        CustomButton(
                                          text: 'Upload from Gallery',
                                          style: getTitleStyle(
                                              color: AppColors.blackColor),
                                          onTap: () {
                                            UploadFromGallery();
                                          },
                                          width: double.infinity,
                                        ),
                                        Gap(10),
                                        CustomButton(
                                            text: 'update',
                                            style: getTitleStyle(
                                                color: AppColors.blackColor),
                                            onTap: () {
                                              Navigator.pop(context);
                                              AppLocalStorage.cacheData(
                                                  AppLocalStorage.Image_Key,
                                                  image!);
                                            })
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            });
                      },
                      icon: Icon(
                        Icons.camera_alt_rounded,
                        size: 20,
                        color: AppColors.lemonadaColor,
                      )),
                )
              ],
            ),
            const Gap(60),
            const Divider(
              indent: 20,
              endIndent: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: getTitleStyle(color: AppColors.lemonadaColor),
                ),
                Spacer(),
                IconButton(
                    onPressed: () {
                      showModalBottomSheet(
                          context: context,
                          builder: (BuildContext context) {
                            return SizedBox(
                              height: 200,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: AppColors.containerBg,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: Column(
                                    children: [
                                      Gap(10),
                                      TextFormField(
                                          onChanged: (value) {
                                            setState(() {
                                              name = value;
                                            });
                                          },
                                          decoration: InputDecoration(
                                              hintText: name,
                                              hintStyle: getBodyStyle(
                                                  color:
                                                      AppColors.whiteColor))),
                                      Gap(10),
                                      CustomButton(
                                        text: 'Update your Name',
                                        onTap: () {
                                          Navigator.pop(context);
                                          AppLocalStorage.cacheData(
                                              AppLocalStorage.Name_Key, name);
                                        },
                                        width: double.infinity,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            );
                          });
                    },
                    icon: Icon(
                      Icons.edit_rounded,
                      color: AppColors.lemonadaColor,
                    ))
              ],
            ),
          ],
        ),
      )),
    );
  }

  UploadFromCamera() async {
    var pickedimage = await ImagePicker().pickImage(source: ImageSource.camera);
    if (pickedimage != null) {
      setState(() {
        image = pickedimage.path;
      });
    }
  }

  UploadFromGallery() async {
    var pickedimage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedimage != null) {
      setState(() {
        image = pickedimage.path;
      });
    }
  }
}
