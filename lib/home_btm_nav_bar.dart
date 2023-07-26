import 'package:flutter/material.dart';
import 'package:learnflutter/views/expandable_text/expandable_text.dart';
import 'package:learnflutter/views/main_menu/main_menu.dart';
import 'package:learnflutter/views/movie_list/movie_list._screen.dart';

class HomeBottomNavBar extends StatefulWidget {
  const HomeBottomNavBar({super.key});

  @override
  State<HomeBottomNavBar> createState() => _HomeBottomNavBarState();
}

class _HomeBottomNavBarState extends State<HomeBottomNavBar> {
  int _navBarCurrentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _navBarCurrentIndex,
        children: const <Widget>[
          MainMenu(),
          ExpandableTextScreen(),
          MovieListScreen()
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _navBarCurrentIndex,
          onTap: (index) {
            setState(() {
              _navBarCurrentIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.text_snippet_outlined), label: "Expand Text"),
            BottomNavigationBarItem(
                icon: Icon(Icons.movie_filter_outlined), label: "Movie List"),
          ]),
    );
  }
}
