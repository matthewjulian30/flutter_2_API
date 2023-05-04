import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:uts_2072001/data/data_movie.dart';
import 'package:uts_2072001/data/list_movie.dart';
import 'package:uts_2072001/presentation/pages/detailpage.dart';
import 'package:uts_2072001/presentation/widgets/greeting.dart';
import 'package:uts_2072001/presentation/widgets/grid.dart';
import 'package:uts_2072001/presentation/widgets/nosearch.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // TextField controller
  TextEditingController controller = TextEditingController();

  // List (ids, titles, actors, posters)
  MovieList movieList = MovieList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 28, 28, 39),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              const SizedBox(height: 10),
              // Greetings and Avatar
              const Greeting(),
              // Spacer
              const SizedBox(
                height: 25,
              ),
              // Search
              Row(
                children: [
                  // Search TextField
                  Expanded(
                    child: TextField(
                      controller: controller,
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: const Color.fromARGB(255, 52, 53, 62),
                          prefixIcon: const Icon(
                            Icons.search,
                            color: Color.fromARGB(255, 109, 108, 115),
                          ),
                          hintText: 'Search Movie ...',
                          hintStyle: const TextStyle(
                              color: Color.fromARGB(255, 109, 108, 115)),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(50)),
                          contentPadding:
                              const EdgeInsets.symmetric(vertical: 10)),
                      style: const TextStyle(fontSize: 15, color: Colors.white),
                    ),
                  ),
                  // Spacer
                  const SizedBox(
                    width: 10,
                  ),
                  // Search Button
                  ElevatedButton(
                      onPressed: () {
                        movieList.clearIds();
                        movieList.clearTitles();
                        movieList.clearActors();
                        movieList.clearPosters();
                        Movie.fetchMovie(controller.text).then((value) {
                          for (int i = 0; i < value.length; i++) {
                            movieList.ids.add(value[i].id);
                            movieList.titles.add(value[i].title);
                            movieList.actors.add(value[i].actors);
                            (value[i].posters != null)
                                ? movieList.posters.add(value[i].posters)
                                : movieList.posters.add('');
                          }
                          setState(() {});
                        });
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 242, 119, 6),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15))),
                      child: const Text(
                        'search',
                        style: TextStyle(fontSize: 12),
                      ))
                ],
              ),
              // Spacer
              const SizedBox(
                height: 25,
              ),
              // Movie list
              movieList.titles.isNotEmpty
                  ? Grid(
                      titles: movieList.titles,
                      ids: movieList.ids,
                      posters: movieList.posters)
                  : const NoSearch() // If the user has not tapped search
            ],
          ),
        ),
      ),
    );
  }
}
