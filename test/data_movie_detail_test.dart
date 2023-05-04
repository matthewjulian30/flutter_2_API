import 'package:uts_2072001/data/data_movie.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:uts_2072001/data/data_movie_detail.dart';

void main() async {
  // MovieDetail movies = await MovieDetail.fetchMovie('tt6486762');
  MovieDetail movies = await MovieDetail.fetchMovie('tt10366206');
  // MovieDetail movies = await MovieDetail.fetchMovie('tt2385255');
  print(movies.title);
  print(movies.description);
  print(movies.posters);
  print(movies.rating);
  print(movies.genres);
  print(movies.year);
  print(movies.duration);
  for (int i = 0; i < movies.actors.length; i++) {
    print(movies.actors[i]);
  }
}
