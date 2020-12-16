import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  void setupWorldTime() async {
    // methode tres important elle permet de push une nouvelle page sur la pile
    // de route en remplacent la precedente page qui se trouvait en sommet
    // de pile
    // ici le loading screen ne sera plus jamais utile cette methode va permettre
    // de le supprimer de la pile
    // le troisieme argument permet de passer des propriété de page en page
    // sois forme d'une map
    Timer(Duration(seconds: 1),
        () => Navigator.pushReplacementNamed(context, '/home', arguments: {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.teal[500],
        body: Center(
          child: SpinKitFadingCircle(
            color: Colors.white,
            size: 50.0,
          ),
        ));
  }
}
