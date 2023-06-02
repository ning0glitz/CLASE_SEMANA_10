import 'package:clase_semana_10/ui/pelicula.dart';
import 'package:flutter/material.dart';
//import 'package:themoviedb/api/themoviedbservice.dart';
//import 'package:themoviedb/ui/spinnerwidget.dart';
//import 'package:themoviedb/ui/cajapelicula.dart';
import 'package:clase_semana_10/ui/spinnerwidget.dart';
import 'package:clase_semana_10/api/themoviedbservice.dart';
import 'package:clase_semana_10/ui/cajapelicula.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
// This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: MovieDBPage(),
    );
  }
}

class MovieDBPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Peliculas eduardo valoradas')),
        body: FutureBuilder(
//podría poner
//initialData: [],
          future: TheMovieDBService.getTopRatedMovies(),
          builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  var pelicula = snapshot.data![index];
                  return CajaPelicula(peli: pelicula);
                },
              );
            } else {
              return SpinnerWidget();
            }
          },
        ));
  }
}
