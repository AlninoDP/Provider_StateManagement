import 'package:flutter/material.dart';
import 'package:learnflutter/models/movie_data.dart';
import 'package:learnflutter/models/movie_model.dart';
import 'package:learnflutter/models/theme_services.dart';
import 'package:provider/provider.dart';

class MovieListScreen extends StatefulWidget {
  const MovieListScreen({super.key});

  @override
  State<MovieListScreen> createState() => _MovieListScreenState();
}

class _MovieListScreenState extends State<MovieListScreen> {
  @override
  Widget build(BuildContext context) {
    bool themeServices = context.watch<ThemeServices>().isDarkModeOn;
    void showSnackbar(String snackBarText) {
      final SnackBar snackBar = SnackBar(
          duration: const Duration(milliseconds: 500),
          content: Text(snackBarText));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }

    List<MovieModel> listMovie = context.watch<MovieData>().movies;
    List<MovieModel> myList = context.watch<MovieData>().myList;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Movie List "),
        centerTitle: true,
        actions: [
          IconButton(
              iconSize: 40,
              onPressed: () {
                Provider.of<ThemeServices>(context, listen: false)
                    .toggleTheme();
              },
              icon: themeServices
                  ? const Icon(Icons.toggle_on_sharp)
                  : const Icon(
                      Icons.toggle_off_sharp,
                    ))
        ],
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
                    Navigator.pushNamed(context, '/favMovieScreen');
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
                            showSnackbar(
                                "${currentMovie.movieTitle} Added To My List");
                          } else {
                            context
                                .read<MovieData>()
                                .removeFromMyList(currentMovie);
                            showSnackbar(
                                "${currentMovie.movieTitle} Removed From My List");
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
