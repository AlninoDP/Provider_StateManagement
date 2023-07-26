import 'package:flutter/material.dart';
import 'package:learnflutter/home_btm_nav_bar.dart';
import 'package:learnflutter/models/count_model.dart';
import 'package:learnflutter/models/movie_data.dart';
import 'package:learnflutter/routes/routes.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => CountModel(),
      ),
      ChangeNotifierProvider(
        create: (context) => MovieData(),
      )
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Provider Exampler',
      debugShowCheckedModeBanner: false,
      home: const HomeBottomNavBar(),
      routes: routes,
    );
  }
}
