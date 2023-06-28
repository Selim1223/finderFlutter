// ignore: file_names
import 'package:finder_flutter/bachelorDetails.dart';
import 'package:finder_flutter/bachelorPreview.dart';
import 'package:flutter/material.dart';
import 'models/bachelor.dart';
import 'utils/fake_data.dart';

class BachelorListScreen extends StatelessWidget {
  final List<Bachelor> bachelors = generateBachelors();

  BachelorListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Bachelors'),
      ),
      body: ListView.builder(
        itemCount: bachelors.length,
        itemBuilder: (context, index) {
          final bachelor = bachelors[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BachelorDetails(
                    bachelor: bachelor,
                  ),
                ),
              );
            },
            child: BachelorPreview(bachelor: bachelor),
          );
        },
      ),
    );
  }
}



