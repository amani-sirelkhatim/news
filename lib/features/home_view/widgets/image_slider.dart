import 'dart:convert';

import 'package:bottom_bar_matu/utils/app_utils.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:http/http.dart';
import 'package:seccion6/core/news_model/news_model.dart';
import 'package:seccion6/core/utils/colors.dart';
import 'package:seccion6/features/news/cubit/news_cubit.dart';
import 'package:seccion6/features/news/cubit/news_states.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class slider extends StatefulWidget {
  const slider({super.key});

  @override
  State<slider> createState() => _sliderState();
}

class _sliderState extends State<slider> {
  int currentpage = 0;
  List<String> imageUrls = [];
  @override
  void initState() {
    super.initState();

    fetchNewsImageUrls();
  }

  Future<void> fetchNewsImageUrls() async {
    try {
      final apiKey =
          'e60aee32e1d34bfd8c0a7c2d3c23dd0e'; // Replace with your News API key
      final response = await get(
        Uri.parse(
            'https://newsapi.org/v2/top-headlines?country=us&apiKey=$apiKey&q=general'),
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);

        // Extract image URLs from the articles
        List<dynamic> articles = data['articles'];

        setState(() {
          imageUrls = articles
              .map<String>((article) => article['urlToImage'] as String)
              .where((url) => url != '') // Filter out articles without images
              .toList();
        });
      } else {
        print('Failed to fetch data');
      }
    } catch (error) {
      print('Error: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return imageUrls.isEmpty
        ? Center(
            child: CircularProgressIndicator(),
          )
        : Column(
            children: [
              CarouselSlider.builder(
                  itemCount: imageUrls.length,
                  itemBuilder:
                      (BuildContext context, int index, int realIndex) {
                    return ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          imageUrls[index],
                          height: 150,
                          fit: BoxFit.cover,
                        ));
                  },
                  options: CarouselOptions(
                    onPageChanged: (index, reason) {
                      setState(() {
                        currentpage = index;
                      });
                    },
                    height: 150,
                    aspectRatio: 16 / 9,
                    viewportFraction: 0.7,
                    initialPage: 0,
                    enableInfiniteScroll: true,
                    reverse: false,
                    autoPlay: true,
                    autoPlayInterval: Duration(seconds: 3),
                    autoPlayAnimationDuration: Duration(milliseconds: 800),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enlargeCenterPage: true,
                    enlargeFactor: 0.3,
                    scrollDirection: Axis.horizontal,
                  )),
              Gap(10),
              SmoothPageIndicator(
                controller: PageController(initialPage: currentpage),
                count: imageUrls.length,
                axisDirection: Axis.horizontal,
                effect: ScrollingDotsEffect(
                    dotHeight: 10,
                    dotWidth: 10,
                    activeDotScale: 1.3,
                    activeDotColor: AppColors.lemonadaColor),
              )
            ],
          );
  }
}
