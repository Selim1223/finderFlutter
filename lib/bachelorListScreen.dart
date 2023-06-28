// ignore: file_names
import 'package:finder_flutter/bachelorDetails.dart';
import 'package:finder_flutter/bachelorPreview.dart';
import 'package:flutter/material.dart';
import 'models/bachelor.dart';
import 'utils/fake_data.dart';

class BachelorListScreen extends StatefulWidget {
  const BachelorListScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _BachelorListScreenState createState() => _BachelorListScreenState();
}

class _BachelorListScreenState extends State<BachelorListScreen> {
  List<Bachelor> bachelors = generateBachelors();
  List<Bachelor> likedBachelors = [];

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
                    isLiked: likedBachelors.contains(bachelor),
                    onLike: () {
                      setState(() {
                        if (likedBachelors.contains(bachelor)) {
                          likedBachelors.remove(bachelor);
                        } else {
                          likedBachelors.add(bachelor);
                        }
                      });
                    },
                  ),
                ),
              );
            },
            child: BachelorPreview(
              bachelor: bachelor,
              isLiked: likedBachelors.contains(bachelor),
              onLike: () {
                setState(() {
                  if (likedBachelors.contains(bachelor)) {
                    likedBachelors.remove(bachelor);
                  } else {
                    likedBachelors.add(bachelor);
                  }
                });
              },
            ),
          );
        },
      ),
    );
  }
}
