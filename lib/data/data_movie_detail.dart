import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MovieDetail {
  final String title;
  final String rating;
  final String description;
  final String posters;
  final String duration;
  final String year;
  final List actors;
  final List genres;

  const MovieDetail(
      {required this.title,
      required this.rating,
      required this.description,
      required this.posters,
      required this.duration,
      required this.year,
      required this.actors,
      required this.genres});

  factory MovieDetail.fromJson(Map<String, dynamic> json) {
    List<String> actorList = [];
    String getRating = '';

    // List of actor
    if (json['actor'] == null) {
      actorList.add('none');
    } else {
      for (int i = 0; i < json['actor'].length; i++) {
        actorList.add(json['actor'][i]['name']);
      }
    }

    // String rating
    if (json['aggregateRating'] != null) {
      getRating = json['aggregateRating']['ratingValue'].toString();
    } else {
      getRating = 'none';
    }

    // Duration
    String duration = json['duration'] ?? '';
    // duration == null ?  duration = '' : duration = json['duration'];
    String getDuration = '';
    int durationCharLength = duration.length;
    // conditional, under 1h and more than 1h
    durationCharLength > 4
        ? getDuration = '${duration[2]}h ${duration[4]}${duration[5]}m'
        : durationCharLength != 0
            ? (getDuration = '${duration[2]}${duration[3]}m')
            : getDuration = 'none';

    // Year
    String year = json['datePublished'].toString();
    String getYear = '';
    for (int i = 0; i < 4; i++) {
      getYear = getYear + year[i];
    }
    json['datePublished'] == null ? getYear = 'none' : getYear = getYear;

    return MovieDetail(
      title: json['name'] ?? '',
      description: json['description'] ?? '',
      rating: getRating,
      posters: json['image'] ?? '',
      duration: getDuration,
      year: getYear,
      genres: json['genre'] ?? '',
      actors: actorList,
    );
  }

  static Future<MovieDetail> fetchMovie(String id) async {
    String apiURL = 'https://search.imdbot.workers.dev/?tt=$id';

    var apiResult = await http.get(Uri.parse(apiURL));

    return MovieDetail.fromJson(jsonDecode(apiResult.body)['short']);
  }
}
