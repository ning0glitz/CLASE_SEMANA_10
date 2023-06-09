import 'package:clase_semana_10/ui/cajapelicula.dart';
import 'package:flutter/material.dart';
//import 'package:themoviedb/api/movie.dart';
//import 'package:themoviedb/UI/pelicula.dart';
import 'package:clase_semana_10/api/movie.dart';
import 'package:clase_semana_10/ui/pelicula.dart';

class CajaPelicula extends StatelessWidget {
  Movie peli;

  CajaPelicula({required this.peli});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(this.peli.title),
      subtitle: Text(this.peli.voteAverage.toString() +
          " (" +
          this.peli.voteCount.toString() +
          ")"),
      trailing: Image.network(this.peli.getImage()),
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Pelicula(movie: this.peli)));
      },
    );
  }
}
