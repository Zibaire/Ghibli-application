import 'package:flutter/material.dart';

class Film {
  final String id;
  final String title;
  final String description;
  final String director;
  final String producer;
  final String release_date;
  final String rt_score;
  final String url;
  final List<dynamic> people;
  final List<dynamic> species;
  final List<dynamic> locations;
  final List<dynamic> vehicles;

  Film({
    this.id,
    this.title,
    this.description,
    this.director,
    this.producer,
    this.release_date,
    this.rt_score,
    this.url,
    this.people,
    this.species,
    this.locations,
    this.vehicles,
  });

  factory Film.fromJson(Map<String, dynamic> json) {
    return Film(
        id: json['id'],
        title: json['title'],
        description: json['description'],
        director: json['director'],
        producer: json['producer'],
        release_date: json['release_date'],
        rt_score: json['rt_score'],
        url: json['url'],
        people: json['people'],
        species: json['species'],
        locations: json['locations'],
        vehicles: json['vehicles']);
  }

  static getPosterImage(String title, double scale) {
    String _title = title.toLowerCase() + "_poster.jpg";
    _title = _title.replaceAll(" ", "_").replaceAll("'", "");
    return Image.asset(
      "assets/${_title}", scale: scale,
    );
  }
}
