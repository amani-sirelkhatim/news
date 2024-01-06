import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:seccion6/appconstrants.dart';
import 'package:seccion6/core/news_model/article.dart';
import 'package:seccion6/core/news_model/news_model.dart';
import 'package:seccion6/core/news_model/source.dart';

class ApiServices {
  Future<NewsModel?> getNewsByCategory(String category) async {
    try {
      var res = await Dio().get(
          'https://newsapi.org/v2/top-headlines?apiKey=e60aee32e1d34bfd8c0a7c2d3c23dd0e&country=us&category=$category');
      if (res.statusCode == 200) {
        var news = NewsModel.fromJson(res.data);

        return news;
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future<NewsModel?> getNewsBySearch(String q) async {
    try {
      var res = await Dio().get(
          'https://newsapi.org/v2/top-headlines?apiKey=e60aee32e1d34bfd8c0a7c2d3c23dd0e&q=$q');
      if (res.statusCode == 200) {
        var news = NewsModel.fromJson(res.data);

        return news;
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future<NewsModel?> getNewsBySource(String source) async {
    try {
      var res = await Dio().get(
          'https://newsapi.org/v2/top-headlines?apiKey=e60aee32e1d34bfd8c0a7c2d3c23dd0e&sources=$source');
      if (res.statusCode == 200) {
        var news = NewsModel.fromJson(res.data);

        return news;
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future<NewsModel?> getNewsimage() async {
    try {
      var res = await Dio().get(
          'https://newsapi.org/v2/top-headlines?apiKey=e60aee32e1d34bfd8c0a7c2d3c23dd0e&q=general');
      if (res.statusCode == 200) {
        var news = NewsModel.fromJson(res.data);

        return news;
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
