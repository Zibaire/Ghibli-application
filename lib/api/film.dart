import 'dart:convert';

import 'package:ghibli_film_app/models/film.dart';
import 'package:http/http.dart' as http;

Future<List<Film>> fetchAllFilm() async {
  final response = await http.get("https://ghibliapi.herokuapp.com/films");

  if (response.statusCode == 200) {
    Iterable list = jsonDecode(response.body);
    return list.map((e) => Film.fromJson(e)).toList();
  } else {
    throw Exception('Failed to load films');
  }
}
