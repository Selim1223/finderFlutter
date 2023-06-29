import 'package:finder_flutter/bachelorFavoritesProvider.dart';
import 'package:finder_flutter/finderApp.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => BachelorFavoritesProvider()),
      ],
      child: FinderApp(),
    ),
  );
}
