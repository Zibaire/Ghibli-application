

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ghibli_film_app/api/film.dart';
import 'package:ghibli_film_app/models/film.dart';

import 'film_detail.dart';

class FilmListPage extends StatefulWidget {
  FilmListPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _FilmListPageState createState() => _FilmListPageState();
}

class _FilmListPageState extends State<FilmListPage> {
  Future<List<Film>> futureFilms;

  @override
  void initState() {
    super.initState();
    futureFilms = fetchAllFilm();
  }

  Widget createListView(List<Film> films) {
    return ListView.builder(
      itemCount: films.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => FilmDetail(
                        film: films[index],
                      )),
            );
          },
          child: Card(
            elevation: 1,
            child: Column(
              children: <Widget>[
                Container(
                  child: Text(
                    films[index].title,
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                ),
                Text(
                  films[index].producer,
                  style: TextStyle(fontSize: 20, fontStyle: FontStyle.italic),
                ),
                Text(
                  films[index].release_date,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                Film.getPosterImage(films[index].title, 1.0),
                Divider()
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        child: FutureBuilder<List<Film>>(
          future: futureFilms,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<Film> films = snapshot.data;
              return createListView(films);
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }
            return Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
