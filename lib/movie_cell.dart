import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:movies_discover_app/get_json.dart';

// ignore: must_be_immutable
class MovieCell extends StatelessWidget {
  final movies;
  final index;
  var mainColor = Colors.black;

  MovieCell(this.movies, this.index);

  @override
  Widget build(BuildContext context) {
    return new Column(
      children: <Widget>[
        new Row(
          children: <Widget>[
            new Padding(
              padding: const EdgeInsets.all(0.0),
              child: new Container(
                margin: const EdgeInsets.all(16.0),
//                                child: new Image.network(GetJson.IMAGE_URL+movies[i]['poster_path'],width: 100.0,height: 100.0),
                child: new Container(
                  width: 70.0,
                  height: 70.0,
                ),
                decoration: new BoxDecoration(
                  borderRadius: new BorderRadius.circular(10.0),
                  color: Colors.grey,
                  image: new DecorationImage(
                      image: new NetworkImage(
                          GetJson.IMAGE_URL + movies[index]['poster_path']),
                      fit: BoxFit.cover),
                  boxShadow: [
                    new BoxShadow(
                        color: mainColor,
                        blurRadius: 5.0,
                        offset: new Offset(2.0, 5.0))
                  ],
                ),
              ),
            ),
            new Expanded(
                child: new Container(
              margin: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 0.0),
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  new Text(
                    movies[index]['title'],
                    style: new TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: mainColor),
                  ),
                  new Padding(padding: const EdgeInsets.all(2.0)),
                  new Text(
                    movies[index]['overview'],
                    maxLines: 2,
                    style: new TextStyle(color: Colors.black.withOpacity(0.5)),
                  )
                ],
              ),
            )),
          ],
        ),
        new Container(
          width: 300.0,
          height: 0.5,
          color: Colors.black.withOpacity(0.5),
          margin: const EdgeInsets.all(16.0),
        )
      ],
    );
  }
}
