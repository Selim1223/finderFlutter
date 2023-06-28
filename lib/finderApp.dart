// ignore: file_names
import 'package:finder_flutter/bachelorListScreen.dart';
import 'package:flutter/material.dart';

class FinderApp extends StatelessWidget {
  const FinderApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bachelors App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BachelorListScreen(),
    );
  }
}
