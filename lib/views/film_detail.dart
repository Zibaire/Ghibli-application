import 'package:flutter/material.dart';
import 'package:ghibli_film_app/models/film.dart';

class FilmDetail extends StatefulWidget {
  FilmDetail({Key key, this.film}) : super(key: key);
  final Film film;

  @override
  _FilmDetailState createState() => _FilmDetailState(film);
}

class _FilmDetailState extends State<FilmDetail> {
  Film film;

  _FilmDetailState(this.film);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(film.title),
        ),
        body: new ListView(
          children: [
            Film.getPosterImage(film.title, 1.0),
            Container(
              padding: const EdgeInsets.all(32.0),
              child: Row(
                children: [
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          child: Text(
                        film.title,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      )),
                      SizedBox(height: 10),
                      Container(
                          child: Text(
                        "Release date: " + film.release_date,
                        style: TextStyle(
                            color: Colors.grey, fontWeight: FontWeight.bold),
                      )),
                      Container(
                          child: Text(
                        "Producer: ${film.producer}",
                        style: TextStyle(color: Colors.grey),
                      )),
                      Container(
                          child: Text(
                        "Director : ${film.director}",
                        style: TextStyle(color: Colors.grey),
                      )),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                          child: Text(
                        film.description,
                        style: TextStyle(
                            color: Colors.black, fontStyle: FontStyle.italic),
                      )),
                    ],
                  )),
                ],
              ),
            )
          ],
        ));
  }
}
