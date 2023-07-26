import 'dart:math';

import 'package:flutter/material.dart';
import 'package:learnflutter/models/movie_model.dart';

//* generate movie list
List<MovieModel> initialData = List.generate(
    50,
    (index) => MovieModel(
        movieTitle: "Movie $index",
        movieDuration: "${Random().nextInt(100) + 50} Minutes"));

class MovieData extends ChangeNotifier {
//* list of MovieModel from generated list
  final List<MovieModel> _movies = initialData;
  List<MovieModel> get movies => _movies;

  final List<MovieModel> _myList = []; //* myList
  List<MovieModel> get myList => _myList;

  void addToMyList(MovieModel movie) {
    _myList.add(movie);
    notifyListeners();
  }

  void removeFromMyList(MovieModel movie) {
    _myList.remove(movie);
    notifyListeners();
  }
}
