import 'package:flutter/material.dart';
import 'package:life_time/pages/home.dart';
import 'package:life_time/pages/loading.dart';
import 'package:life_time/pages/planting.dart';

void main() {
  runApp(MaterialApp(
    // initiale route permet de specifier
    // la route que l'on veux affichier en premier dans l'application
    // par defaut la route choisi est '/',
    // cette propriete est surtout utilisé dans les phase de test
    initialRoute: '/',
    routes: {
      // le context est un objet qui garde en memoire notre
      // position dans l'abre de widget
      '/': (context) => Loading(),
      '/home': (context) => Home(),
      //'/planting': (context) => Planting(),
    },
  ));
}
