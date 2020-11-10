import 'package:flutter/material.dart';
import 'package:movies_discover_app/get_json.dart';
import 'movie_cell.dart';
import 'movie_detail.dart';
import 'movie_title.dart';

class MovieList extends StatefulWidget {
  @override
  MovieListState createState() {
    return new MovieListState();
  }
}

class MovieListState extends State<MovieList> {
  var movies;
  var mainColor = Colors.black;

  void getData() async {
    var data = await GetJson.getJson();
    setState(() {
      movies = data['results'];
    });
  }

  @override
  Widget build(BuildContext context) {
    getData();
    return new Scaffold(
      backgroundColor: Colors.white,
      appBar: new AppBar(
        elevation: 0.3,
        centerTitle: true,
        backgroundColor: Colors.red[900],
        title: new Text(
          'Discover Movies',
          style:
              new TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: new Stack(
        children: [
          Center(
            child: CircularProgressIndicator(
              valueColor: new AlwaysStoppedAnimation<Color>(Colors.red[900]),
            ),
          ),
          Center(
            child: new Padding(
              padding: const EdgeInsets.all(16.0),
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new MovieTitle(),
                  new Expanded(
                    child: new ListView.builder(
                        itemCount: movies == null ? 0 : movies.length,
                        itemBuilder: (context, index) {
                          return new FlatButton(
                            child: new MovieCell(movies, index),
                            padding: const EdgeInsets.all(0.0),
                            onPressed: () {
                              Navigator.push(context,
                                  new MaterialPageRoute(builder: (context) {
                                return new MovieDetail(movies[index]);
                              }));
                            },
                            color: Colors.white,
                          );
                        }),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
