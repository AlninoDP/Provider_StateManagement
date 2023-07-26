import 'package:flutter/material.dart';
import 'package:learnflutter/models/movie_data.dart';
import 'package:learnflutter/models/movie_model.dart';
import 'package:provider/provider.dart';

class FavMovieScreen extends StatelessWidget {
  const FavMovieScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<MovieModel> myList = context.watch<MovieData>().myList;
    return Scaffold(
      appBar: AppBar(
        title: const Text("MyList Favorite Movie"),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Expanded(
                child: ListView.builder(
                    itemCount: myList.length,
                    itemBuilder: (context, index) {
                      final currentMovie = myList[index];
                      return Card(
                        elevation: 4,
                        color: Colors.blue,
                        child: ListTile(
                          title: Text(
                            currentMovie.movieTitle,
                            style: const TextStyle(
                                color: Colors.white, fontSize: 18),
                          ),
                          subtitle: Text(currentMovie.movieDuration,
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 15)),
                        ),
                      );
                    }))
          ],
        ),
      ),
    );
  }
}
