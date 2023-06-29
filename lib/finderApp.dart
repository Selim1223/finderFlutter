import 'package:finder_flutter/bachelorListScreen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
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
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
