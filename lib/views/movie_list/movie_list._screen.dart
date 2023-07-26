import 'package:flutter/material.dart';
import 'package:learnflutter/models/movie_data.dart';
import 'package:learnflutter/models/movie_model.dart';
import 'package:learnflutter/views/fav_movie/fav_movie_screen.dart';
import 'package:provider/provider.dart';

class MovieListScreen extends StatefulWidget {
  const MovieListScreen({super.key});

  @override
  State<MovieListScreen> createState() => _MovieListScreenState();
}

class _MovieListScreenState extends State<MovieListScreen> {
  @override
  Widget build(BuildContext context) {
    List<MovieModel> listMovie = context.watch<MovieData>().movies;
    List<MovieModel> myList = context.watch<MovieData>().myList;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Movie List "),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Card(
                color: Colors.red,
                elevation: 4,
                child: ListTile(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const FavMovieScreen()));
                  },
                  leading: const Icon(
                    Icons.favorite,
                    size: 30,
                    color: Colors.white,
                  ),
                  title: Center(
                    child: Text(
                      'Go To Mylist (${myList.length})',
                      style: const TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                  trailing: const Icon(
                    Icons.favorite,
                    size: 30,
                    color: Colors.white,
                  ),
                )),
            Expanded(
              child: ListView.builder(
                  itemCount: listMovie.length,
                  itemBuilder: (context, index) {
                    final currentMovie = listMovie[index];
                    return Card(
                      color: Colors.blue,
                      elevation: 4,
                      child: ListTile(
                        title: Text(
                          currentMovie.movieTitle,
                          style: const TextStyle(
                              color: Colors.white, fontSize: 18),
                        ),
                        subtitle: Text(currentMovie.movieDuration,
                            style: const TextStyle(
                                color: Colors.white, fontSize: 15)),
                        trailing: Icon(
                          Icons.favorite,
                          color: myList.contains(currentMovie)
                              ? Colors.red
                              : Colors.white,
                          size: 30,
                        ),
                        onTap: () {
                          if (!myList.contains(currentMovie)) {
                            context.read<MovieData>().addToMyList(currentMovie);
                          } else {
                            context
                                .read<MovieData>()
                                .removeFromMyList(currentMovie);
                          }
                        },
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
