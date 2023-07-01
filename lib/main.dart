import 'package:finder_flutter/provider/bachelorFavoritesProvider.dart';
import 'package:finder_flutter/finderApp.dart';
import 'package:finder_flutter/provider/themeProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => BachelorFavoritesProvider()),
         ChangeNotifierProvider(create: (_) => ThemeProvider()),
      ],
      child: FinderApp(),
    ),
  );
}
