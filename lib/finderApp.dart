// ignore: file_names
import 'package:finder_flutter/bachelorListScreen.dart';
import 'package:finder_flutter/provider/themeProvider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'bachelorFavorites.dart';

class FinderApp extends StatelessWidget {
  FinderApp({Key? key});

  final GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const BachelorListScreen();
        },
        routes: <RouteBase>[
          GoRoute(
            path: 'favorites',
            builder: (BuildContext context, GoRouterState state) {
              return const BachelorsFavorites();
            },
          ),
        ],
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      debugShowCheckedModeBanner: false,
      title: 'Bachelors App',
      theme: ThemeData.light(), // Thème par défaut (Light Mode)
      darkTheme: ThemeData.dark(), // Thème Dark Mode
      themeMode: Provider.of<ThemeProvider>(context).currentTheme ==
              AppTheme.Light
          ? ThemeMode.light
          : ThemeMode.dark,
    );
  }
}
