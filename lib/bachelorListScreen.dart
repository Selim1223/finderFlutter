// ignore: file_names
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
          return ListTile(
            leading: Image.asset(
              bachelor.avatar,
              width: 48,
              height: 48,
            ),
            title: Text('${bachelor.firstname} ${bachelor.lastname}'),
            subtitle: Text(bachelor.job),
            trailing: Text(bachelor.gender.toString()),
          );
        },
      ),
    );
  }
}
