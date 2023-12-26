import 'package:flutter/material.dart';
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
          children: const [
            grid(),
            grid(),
            grid(),
            grid(),
          ],
        ),
      ),
    );
  }
}
