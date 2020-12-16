import 'dart:async';
import 'package:flutter/material.dart';
import 'package:life_time/pages/home.dart';
import 'package:get/get.dart';

class Planting extends StatefulWidget {
  int plantingTimeLeft;
  Planting({Key key, @required this.plantingTimeLeft}) : super(key: key);

  @override
  _PlantingState createState() => _PlantingState();
}

class _PlantingState extends State<Planting> {
  int plantingTimeDone = 0;

  Timer _timer;

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
      (Timer timer) => setState(
        () {
          if (widget.plantingTimeLeft < 1) {
            timer.cancel();
          } else {
            plantingTimeDone = plantingTimeDone + 1;
            widget.plantingTimeLeft = widget.plantingTimeLeft - 1;
          }
        },
      ),
    );
  }

  @override
  void initState() {
    widget.plantingTimeLeft = 20;
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  void createState() {
    if (widget.plantingTimeLeft == 0 && !this._timer.isActive) {
      Get.to(Home());
      // Navigator.pushReplacement(
      //   context,
      //   MaterialPageRoute(
      //     builder: (context) => Home(
      //       plantingTimeLeft: widget.plantingTimeLeft,
      //       plantingTimeDone: this.plantingTimeDone,
      //     ),
      //   ),
      // );
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.plantingTimeLeft == 0 && !this._timer.isActive) {
      Get.toNamed('/home');
      // Navigator.pushReplacement(
      //   context,
      //   MaterialPageRoute(
      //     builder: (context) => Home(
      //       plantingTimeLeft: widget.plantingTimeLeft,
      //       plantingTimeDone: this.plantingTimeDone,
      //     ),
      //   ),
      // );
    }
    return Scaffold(
      backgroundColor: Colors.teal[500],
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(7.5),
                child: Container(
                  width: 270,
                  height: 270,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage('assets/bush.png'))),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '${widget.plantingTimeLeft}',
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                  letterSpacing: 3,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RaisedButton(
                padding: EdgeInsets.fromLTRB(35, 15, 35, 15),
                elevation: 7,
                focusColor: Colors.teal[600],
                focusElevation: 0,
                onPressed: () => Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Home(
                      plantingTimeLeft: widget.plantingTimeLeft,
                      plantingTimeDone: this.plantingTimeDone,
                    ),
                  ),
                ), //Navigator.pop(context),
                child: Text(
                  'Annuler',
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
                color: Colors.teal[800],
              )
            ],
          ),
          SizedBox(
            height: 30,
          ),
        ],
      )),
    );
  }
}
