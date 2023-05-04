import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:uts_2072001/presentation/widgets/back.dart';
import 'package:uts_2072001/presentation/widgets/rating.dart';

import '../../data/data_movie_detail.dart';

class DetailPage extends StatefulWidget {
  final String id;

  const DetailPage({super.key, required this.id});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  String title = '';
  bool _isPanelVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 28, 28, 39),
      body: SafeArea(
        child: Center(
          child: FutureBuilder<MovieDetail>(
            future: MovieDetail.fetchMovie(widget.id),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final details = snapshot.data!;
                title = details.title;
                return Stack(
                  children: [
                    // Background
                    Container(
                      color: const Color.fromARGB(255, 28, 28, 39),
                    ),
                    // Poster
                    Align(
                        alignment: Alignment.topCenter,
                        child: details.posters == ''
                            ? const Text(
                                'no data',
                                style: TextStyle(color: Colors.white),
                              )
                            : Image.network(details.posters)),
                    // X icon for back to home page
                    const Back(),
                    // Title, Rating, Desc
                    SlidingUpPanel(
                      maxHeight: 700,
                      minHeight: 300,
                      borderRadius: BorderRadius.circular(15),
                      color: const Color.fromARGB(255, 28, 28, 39),
                      panel: Padding(
                        padding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
                        child: Column(
                          children: [
                            // Title
                            Text(
                              details.title,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30,
                                  color: Colors.white),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            // Row Rating & Duration
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  width: 70,
                                  height: 70,
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.grey),
                                      borderRadius: BorderRadius.circular(15)),
                                  child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const Icon(
                                          Icons.star_border_rounded,
                                          size: 30,
                                          color: Colors.grey,
                                        ),
                                        Text(details.rating,
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 12))
                                      ]),
                                ),
                                Container(
                                  width: 70,
                                  height: 70,
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.grey),
                                      borderRadius: BorderRadius.circular(15)),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Icon(
                                        Icons.access_time,
                                        size: 30,
                                        color: Colors.grey,
                                      ),
                                      Text(
                                        details.duration,
                                        style: const TextStyle(
                                            color: Colors.white, fontSize: 12),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  width: 70,
                                  height: 70,
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.grey),
                                      borderRadius: BorderRadius.circular(15)),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Icon(
                                        Icons.date_range_rounded,
                                        size: 30,
                                        color: Colors.grey,
                                      ),
                                      Text(
                                        details.year,
                                        style: const TextStyle(
                                            color: Colors.white, fontSize: 12),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                            // Rating
                            // Rating(rating: details.rating),
                            const SizedBox(
                              height: 20,
                            ),

                            // Genre
                            const SizedBox(
                                width: double.infinity,
                                child: Text(
                                  'Genre',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontSize: 20),
                                  textAlign: TextAlign.start,
                                )),
                            const SizedBox(height: 5),
                            SizedBox(
                              height: 30,
                              child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: details.genres.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return Row(
                                      children: [
                                        Container(
                                          height: 30,
                                          decoration: BoxDecoration(
                                              color: const Color.fromARGB(
                                                  255, 51, 52, 60),
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          child: Center(
                                              child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 20),
                                            child: Text(
                                              details.genres[index],
                                              style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 12),
                                            ),
                                          )),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                      ],
                                    );
                                  }),
                            ),
                            const SizedBox(
                              height: 20,
                            ),

                            // Actors
                            const SizedBox(
                                width: double.infinity,
                                child: Text(
                                  'Actors',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontSize: 20),
                                  textAlign: TextAlign.start,
                                )),
                            const SizedBox(height: 5),
                            SizedBox(
                              width: double.infinity,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  for (int i = 0;
                                      i < details.actors.length;
                                      i++)
                                    Text(
                                      details.actors[i],
                                      style: const TextStyle(
                                        color: Colors.grey,
                                      ),
                                    ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),

                            // Description
                            const SizedBox(
                                width: double.infinity,
                                child: Text(
                                  'Description',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontSize: 20),
                                  textAlign: TextAlign.start,
                                )),
                            const SizedBox(height: 5),
                            Text(
                              details.description,
                              textAlign: TextAlign.justify,
                              style: const TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                );
                // return Text(snapshot.data!.name);
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }

              // By default, show a loading spinner.
              return const CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}
