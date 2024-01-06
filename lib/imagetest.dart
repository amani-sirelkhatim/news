import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class test extends StatefulWidget {
  @override
  _testState createState() => _testState();
}

class _testState extends State<test> {
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
      final response = await http.get(
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
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('News Image URLs'),
        ),
        body: ListView.builder(
          itemCount: imageUrls.length,
          itemBuilder: (context, index) {
            return ListTile(
              leading: Icon(Icons.image),
              title: Text('Image $index'),
              subtitle: Text(imageUrls[index]),
            );
          },
        ),
      ),
    );
  }
}
