import 'package:flutter/material.dart';

class MovieTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Padding(
      padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      child: new Text(
        'Top Rated Movies',
        style: new TextStyle(
          fontSize: 30.0,
          color: Colors.red[900],
          fontWeight: FontWeight.bold,
        ),
        textAlign: TextAlign.left,
      ),
    );
  }
}