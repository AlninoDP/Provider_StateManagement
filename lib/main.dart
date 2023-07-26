import 'package:flutter/material.dart';
import 'package:learnflutter/app_theme.dart';
import 'package:learnflutter/home_btm_nav_bar.dart';
import 'package:learnflutter/models/count_model.dart';
import 'package:learnflutter/models/movie_data.dart';
import 'package:learnflutter/models/theme_services.dart';
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
      ),
      ChangeNotifierProvider(
        create: (context) => ThemeServices(),
      ),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeServices>(
      builder: (context, themeServices, child) {
        return MaterialApp(
          title: 'Provider Exampler',
          debugShowCheckedModeBanner: false,
          themeMode:
              themeServices.isDarkModeOn ? ThemeMode.dark : ThemeMode.light,
          theme: AppThemes.lightTheme,
          darkTheme: AppThemes.darkTheme,
          home: const HomeBottomNavBar(),
          routes: routes,
        );
      },
    );
  }
}
