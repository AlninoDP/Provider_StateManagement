import 'package:flutter/material.dart';
import 'package:learnflutter/views/expandable_text/expandable_text.dart';
import 'package:learnflutter/views/fav_movie/fav_movie_screen.dart';
import 'package:learnflutter/views/main_menu/main_menu.dart';
import 'package:learnflutter/views/movie_list/movie_list._screen.dart';

Map<String, WidgetBuilder> routes = {
  '/root': (context) => const MainMenu(),
  '/expandableTextScreen': (context) => const ExpandableTextScreen(),
  '/movieListScreen': (context) => const MovieListScreen(),
  '/favMovieScreen': (context) => const FavMovieScreen(),
};
