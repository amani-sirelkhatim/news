import 'package:flutter/material.dart';
import 'package:seccion6/core/functions/functions.dart';
import 'package:seccion6/features/source/sourcenews.dart';
import 'package:seccion6/features/source/widgets/sourcewidget.dart';

class source extends StatefulWidget {
  const source({super.key});

  @override
  State<source> createState() => _sourceState();
}

class _sourceState extends State<source> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Find Your Source'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: GridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          children: [
            GestureDetector(
                onTap: () {
                  push(context,
                      sourcenews(source: 'bbc-news', name: 'BBC News'));
                },
                child: grid(image: 'assets/bbc.png', name: 'BBC News')),
            GestureDetector(
                onTap: () {
                  push(context,
                      sourcenews(source: 'abc-news', name: 'ABC News'));
                },
                child: grid(image: 'assets/abc.jpeg', name: 'Abc News')),
            GestureDetector(
                onTap: () {
                  push(context, sourcenews(source: 'cnn', name: 'CNN News'));
                },
                child: grid(image: 'assets/cnn.jpg', name: 'CNN News')),
            GestureDetector(
                onTap: () {
                  push(
                      context, sourcenews(source: 'axios', name: 'Axios News'));
                },
                child: grid(image: 'assets/ax.png', name: 'Axios News')),
            GestureDetector(
                onTap: () {
                  push(context,
                      sourcenews(source: 'bloomberg', name: 'Bloomberg News'));
                },
                child: grid(image: 'assets/blom.jpg', name: 'Bloomberg News')),
            GestureDetector(
                onTap: () {
                  push(
                      context,
                      sourcenews(
                          source: 'business-insider',
                          name: 'Business Insider News'));
                },
                child: grid(image: 'assets/bi.jpg', name: 'Business-insider')),
            GestureDetector(
                onTap: () {
                  push(context,
                      sourcenews(source: 'buzzfeed', name: 'Buzzfeed News'));
                },
                child: grid(image: 'assets/buzz.jpg', name: 'Buzzfeed News')),
            GestureDetector(
                onTap: () {
                  push(
                      context,
                      sourcenews(
                        source: 'cbs-news',
                        name: 'CBC News',
                      ));
                },
                child: grid(image: 'assets/cbc.png', name: 'CBC News'))
          ],
        ),
      ),
    );
  }
}
