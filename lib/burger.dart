import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:seccion6/core/utils/colors.dart';
import 'package:seccion6/core/utils/styles.dart';

class burger extends StatefulWidget {
  const burger({super.key});

  @override
  State<burger> createState() => _burgerState();
}

class _burgerState extends State<burger> {
  @override
  Widget build(BuildContext context) {
    int counter = 0;
    return Scaffold(
      backgroundColor: Color(0xffFFEBD2),
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.arrow_back_ios,
              color: AppColors.whiteColor,
            )),
        backgroundColor: Color(0xffFBD6A9),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                alignment: Alignment.topRight,
                children: [
                  Container(
                    height: 300,
                    width: 300,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color(0xffFE9166)),
                    child: Image.asset(
                      'assets/burger.png',
                      height: 350,
                      width: 350,
                    ),
                  ),
                  Positioned(
                    top: 10,
                    left: 250,
                    child: CircleAvatar(
                      radius: 20,
                      backgroundColor: Color(0xffFFFFFD),
                      child: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.favorite_outline_outlined,
                            color: Color(0xffFE9166),
                          )),
                    ),
                  )
                ],
              ),
              Gap(20),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('The Seceret Burger',
                      style: getTitleStyle(color: Color(0XFFAC5043))),
                ],
              ),
              Gap(10),
              Row(
                children: [
                  Icon(Icons.star, color: Color(0XFFAC5043)),
                  Text(
                    '4(0)',
                    style: getSmallStyle(color: AppColors.blackColor),
                  ),
                  Spacer(),
                  Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        color: Color(0xffFE9166)),
                    child: Row(
                      children: [
                        FloatingActionButton(
                          mini: true,
                          onPressed: () {
                            setState(() {
                              counter--;
                            });
                          },
                          child: Icon(Icons.remove),
                        ),
                        Text(counter.toString()),
                        FloatingActionButton(
                          mini: true,
                          onPressed: () {
                            setState(() {
                              counter++;
                            });
                          },
                          child: Icon(Icons.add),
                        ),
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
