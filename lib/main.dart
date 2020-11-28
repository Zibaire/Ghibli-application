import 'package:flutter/material.dart';
import 'package:ghibli_film_app/views/film_list.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ghibli Universe',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Ghibli Universe'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Map<String, dynamic>> cards_info = [
    {
      "title": "Movies",
      "path": "assets/movies_ghibli.jpg",
      "view": FilmListPage(
        title: "Movies",
      )
    },
    {
      "title": "Recipes",
      "path": "assets/recipes_ghibli.jpg",
      "view": FilmListPage(
        title: "Movies",
      )
    },
    {
      "title": "Places",
      "path": "assets/places_ghibli.jpg",
      "view": FilmListPage(
        title: "Movies",
      )
    },
    {
      "title": "Inspiration",
      "path": "assets/inspiration_ghibli.jpg",
      "view": FilmListPage(
        title: "Movies",
      )
    },
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                  itemCount: cards_info.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                        onTap: () {
                          print(cards_info[index]['title']);
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => cards_info[index]['view']),
                          );
                        },
                        child: Container(
                          padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                          height: 220,
                          width: double.maxFinite,
                          child: Card(
                            elevation: 5,
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border(
                                  top: BorderSide(width: 2.0, color: Colors.transparent),
                                ),
                                color: Colors.white,
                                image: DecorationImage(
                                  image: AssetImage(cards_info[index]['path']),
                                  fit: BoxFit.fitWidth,
                                  alignment: Alignment.topCenter,
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(7),
                                child: Stack(children: <Widget>[
                                  Align(
                                    alignment: Alignment.topCenter,
                                    child: Stack(
                                      children: <Widget>[
                                        Row(
                                          children: <Widget>[
                                            Text(
                                              cards_info[index]['title'],
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20,
                                                  backgroundColor: Colors.white),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  )
                                ]),
                              ),
                            ),
                          ),
                        ));
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
