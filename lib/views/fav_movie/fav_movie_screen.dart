import 'package:flutter/material.dart';
import 'package:learnflutter/models/movie_data.dart';
import 'package:learnflutter/models/movie_model.dart';
import 'package:provider/provider.dart';

class FavMovieScreen extends StatelessWidget {
  const FavMovieScreen({super.key});

  @override
  Widget build(BuildContext context) {
    void showSnackbar(String snackBarText) {
      final SnackBar snackBar = SnackBar(
          duration: const Duration(milliseconds: 500),
          content: Text(snackBarText));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }

    List<MovieModel> myList = context.watch<MovieData>().myList;
    return Scaffold(
      appBar: AppBar(
        title: const Text("MyList Favorite Movie"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Expanded(
                child: ListView.builder(
                    itemCount: myList.length,
                    itemBuilder: (context, index) {
                      final currentMovie = myList[index];
                      return Card(
                        elevation: 4,
                        color: Colors.lightBlue,
                        child: ListTile(
                          title: Text(
                            currentMovie.movieTitle,
                            style: const TextStyle(
                                color: Colors.white, fontSize: 18),
                          ),
                          subtitle: Text(currentMovie.movieDuration,
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 15)),
                          trailing: const Icon(
                            Icons.cancel_outlined,
                            color: Colors.red,
                            size: 30,
                          ),
                          onTap: () {
                            context
                                .read<MovieData>()
                                .removeFromMyList(currentMovie);
                            showSnackbar(
                                "${currentMovie.movieTitle} Removed From My List");
                          },
                        ),
                      );
                    }))
          ],
        ),
      ),
    );
  }
}
