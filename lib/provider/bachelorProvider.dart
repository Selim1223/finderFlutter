// ignore: file_names
import 'package:finder_flutter/utils/fake_data.dart';
import 'package:flutter/material.dart';
import '../models/bachelor.dart';

class BachelorsProvider extends ChangeNotifier {
  List<Bachelor> bachelors = generateBachelors();
  List<Bachelor> likedBachelors = [];

  void toggleLike(Bachelor bachelor) {
    if (likedBachelors.contains(bachelor)) {
      likedBachelors.remove(bachelor);
    } else {
      likedBachelors.add(bachelor);
    }
    notifyListeners();
  }
}
