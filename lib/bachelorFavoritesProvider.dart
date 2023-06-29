import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'models/bachelor.dart';

class BachelorFavoritesProvider extends ChangeNotifier {
  final List<Bachelor> _likedBachelors = [];

  List<Bachelor> get likedBachelors => _likedBachelors;

  void addLikedBachelor(Bachelor bachelor) {
    _likedBachelors.add(bachelor);
    notifyListeners();
  }

  void removeLikedBachelor(Bachelor bachelor) {
    _likedBachelors.remove(bachelor);
    notifyListeners();
  }

  void toggleLike(Bachelor bachelor) {
    if (likedBachelors.contains(bachelor)) {
      likedBachelors.remove(bachelor);
    } else {
      likedBachelors.add(bachelor);
    }
    notifyListeners();
  }

  List<Bachelor> getBachelors() {
    return _likedBachelors;
  }

  bool isLiked(Bachelor bachelor) {
    return _likedBachelors.contains(bachelor);
  }
}
