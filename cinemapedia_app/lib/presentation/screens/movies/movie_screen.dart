import 'package:flutter/material.dart';

class MovieScreen extends StatelessWidget {

  static const name = 'movie-screen';

  final String moviId;

  const MovieScreen({
    super.key, 
    required this.moviId
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MovieId: $moviId'),
      ),
    );
  }
}